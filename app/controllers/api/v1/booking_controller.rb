class Api::V1::BookingController < ApiController
  def call_booking
    # Получаем данные и отправляем их в телеграм и на почту
    name = params[:name]
    phone = params[:phone]
    text = params[:text]
    data = { name: name, phone: phone, text: text }
    CallBookingJob.perform_later(data)
  end
  def create
    @booking = Booking.new(booking_params)
    @booking.start_date_formated = booking_params['start_date'].to_datetime
    @booking.end_date_formated = booking_params['end_date'].to_datetime
    if @booking.save
      # redirect_back(fallback_location: success_path, notice: "Заявка успешно создана! Ожидайте звонка оператора. Обработка заявки производится в течение суток")
      # @booking.send_sms
      begin
        @booking.send_tg_message
      rescue => exception
        puts exception
        logger.debug exception
      end
      BookingMailer.with(booking: @booking).new_booking_email.deliver_later

      # Create Client and Booking on RentProg.ru
      begin
        # Get client and check
        def check_phone(phone)
          checked_phone = @booking.phone.to_i.to_s
          checked_phone.slice!(0) if checked_phone.length == 11
          phone == checked_phone ? true : false
        end

        url_get = 'https://rentprog.net/api/v1/get_clients'
        resp_get = Faraday.get(url_get)
        clients = JSON.parse resp_get.body.force_encoding('UTF-8') #строка надо преобразовать в массив
        finded_client =
          clients.find do |client|
            phone = client['phone'].to_i.to_s
            phone.slice!(0) if phone.length == 11
            check_phone(phone)
          end
        if !finded_client
          # # Create client
          # url = 'https://rentprog.net/api/v1/create_client'
          # resp = Faraday.post(url) do |req|
          #     req.body = { clients: {name: "#{@booking.firstname.capitalize}", lastname: "#{@booking.lastname.capitalize}", middlename: "#{@booking.middlename.capitalize}", phone: "#{@booking.phone}", email: "#{@booking.email}" } }.to_json
          #     req.headers['Content-Type'] = 'application/json'
          # end
          # logger.info "Faraday " + " resp:" + resp.body.to_s

          #create client and booking
          url_create_client = 'https://rentprog.net/api/v1/create_client'
          resp_create_client =
            Faraday.post(url_create_client) do |req|
              req.body = {
                clients: {
                  name: "#{@booking.firstname.capitalize}",
                  lastname: "#{@booking.lastname.capitalize}",
                  middlename: "#{@booking.middlename.capitalize}",
                  phone: "#{@booking.phone}",
                  email: "#{@booking.email}",
                },
              }.to_json
              req.headers['Content-Type'] = 'application/json'
            end
          resp_create_client_resp =
            JSON.parse resp_create_client.body.force_encoding('UTF-8')
          url_create_booking = 'https://rentprog.net/api/v1/create_booking'
          resp_create_booking =
            Faraday.post(url_create_booking) do |req|
              req.body = {
                bookings: {
                  company_id: 2,
                  active: 'false',
                  client_id: "#{resp_create_client_resp['id']}",
                  first_name: "#{@booking.firstname.capitalize}",
                  last_name: "#{@booking.lastname.capitalize}",
                  middle_name: "#{@booking.middlename.capitalize}",
                  car_name: "#{@booking.car}",
                  start_date: "#{@booking.start_date}",
                  end_date: "#{@booking.end_date}",
                  additional_hours: "#{@booking.additional_hours}",
                  location_start: "#{@booking.location_start}",
                  location_end: "#{@booking.location_end}",
                  chair: "#{@booking.baby_chair}",
                  navigator: "#{@booking.navigator}",
                  days: "#{@booking.days}",
                  total: "#{@booking.total}",
                  deposit: "#{@booking.deposit}",
                  price: "#{@booking.price}",
                  delivery: "#{@booking.delivery}",
                  equipment: "#{@booking.equipment}",
                },
              }.to_json

              req.headers['Content-Type'] = 'application/json'
            end
          logger.info "Faraday create client #{resp_create_client_resp['id']} and booking #{resp_create_booking['id']}"
        else
          # Create booking
          url = 'https://rentprog.net/api/v1/create_booking'
          resp =
            Faraday.post(url) do |req|
              req.body = {
                bookings: {
                  company_id: 2,
                  active: 'false',
                  client_id: "#{finded_client['id']}",
                  first_name: "#{@booking.firstname.capitalize}",
                  last_name: "#{@booking.lastname.capitalize}",
                  middle_name: "#{@booking.middlename.capitalize}",
                  car_name: "#{@booking.car}",
                  start_date: "#{@booking.start_date}",
                  end_date: "#{@booking.end_date}",
                  additional_hours: "#{@booking.additional_hours}",
                  location_start: "#{@booking.location_start}",
                  location_end: "#{@booking.location_end}",
                  chair: "#{@booking.baby_chair}",
                  navigator: "#{@booking.navigator}",
                  days: "#{@booking.days}",
                  total: "#{@booking.total}",
                  deposit: "#{@booking.deposit}",
                  price: "#{@booking.price}",
                  delivery: "#{@booking.delivery}",
                  equipment: "#{@booking.equipment}",
                },
              }.to_json
              req.headers['Content-Type'] = 'application/json'
            end
          logger.info 'Faraday create booking' + ' resp:' + resp.body.to_s
        end
      rescue => exception
        puts exception
        logger.debug exception
      end

      render json: @booking, adapter: :json, status: :created
    else
      render json: { error: @booking.errors }, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params
      .require(:booking)
      .permit(
        :start_date,
        :end_date,
        :additional_hours,
        :location_start,
        :location_end,
        :firstname,
        :lastname,
        :middlename,
        :baby_chair,
        :phone,
        :email,
        :car,
        :navigator,
        :days,
        :price,
        :accept,
        :total,
        :deposit,
        :delivery,
        :equipment,
      )
  end
end
