class Api::V1::BookingController < ApiController
    def create
        @booking = Booking.new(booking_params)
        if @booking.save
            # redirect_back(fallback_location: success_path, notice: "Заявка успешно создана! Ожидайте звонка оператора. Обработка заявки производится в течение суток")
            # @booking.send_sms
            begin
                # @booking.send_tg_message
            rescue => exception
                puts exception
                logger.debug exception
            end
            # BookingMailer.with(booking: @booking).new_booking_email.deliver_later

            # Create Client on RentProg.ru
            begin
                # Get client and check
                def check_phone(phone)
                    checked_phone = @booking.phone.to_i.to_s
                    if checked_phone.length == 11
                        checked_phone.slice!(0)
                    end
                    phone == checked_phone ? true : false
                end

                url_get = 'https://api.rentprog.ru/api/v1/get_clients'
                resp_get = Faraday.get(url_get)
                clients = JSON.parse resp_get.body.force_encoding("UTF-8") #строка надо преобразовать в массив
                check_double_client = clients.find do |client| 
                    phone = client["phone"].to_i.to_s
                    if phone.length == 11
                        phone.slice!(0)
                    end
                    check_phone(phone)
                end
                if !check_double_client
                    # Create client
                    url = 'https://api.rentprog.ru/api/v1/create_client'
                    resp = Faraday.post(url) do |req|
                        req.body = { clients: {name: "#{@booking.firstname}", lastname: "#{@booking.lastname}", middlename: "#{@booking.middlename}", phone: "#{@booking.phone}", email: "#{@booking.email}" } }.to_json
                        req.headers['Content-Type'] = 'application/json'
                    end
                    logger.info "Faraday " + " resp:" + resp.body.to_s
                else
                    logger.info "Trying create duplicating clients! resp: #{check_double_client}"
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
        params.require(:booking).permit(:start_date, :end_date, :location_start, :location_end, :firstname, :lastname, :middlename, :baby_chair, :phone, :email, :car, :navigator, :days, :price, :accept, :total, :deposit)
    end
end
