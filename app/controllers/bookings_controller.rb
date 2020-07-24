class BookingsController < ApplicationController

  before_action :set_booking, only: [:update, :toggle_rejection]
  before_action :authenticate_user!, only: [:update, :accept, :destroy]
  before_action :set_text, only: [:success, :new]

  def update
    if @booking.update(booking_params)
      flash[:notice] = "Сохранено"
    else
      flash[:alert] = "Что то не так!"
    end
    redirect_back(fallback_location: request.referer)
  end

  def success
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.accept = true
    if @booking.save

      url_get = 'https://api.rentprog.ru/api/v1/get_clients'
      resp_get = Faraday.get(url_get)
      clients = JSON.parse resp_get.body.force_encoding("UTF-8")
      finded_client = clients.find do |client| 
        phone = client["phone"].to_i.to_s
        phone_booking = @booking.phone.to_i.to_s
        
        if phone.length > 10
          phone.slice!(0)
        end
        if phone_booking.length > 10
          phone_booking.slice!(0)
        end

        phone == phone_booking ? true : false
      end

      if finded_client
        # Create booking
        url = 'https://api.rentprog.ru/api/v1/create_booking'
        resp = Faraday.post(url) do |req|
            req.body = { bookings: {company_id: 2, active: "false", client_id: "#{finded_client['id']}", first_name: "#{@booking.firstname}", last_name: "#{@booking.lastname}", middle_name: "#{@booking.middlename}", car_name: "#{@booking.car}", start_date: "#{@booking.start_date}", end_date: "#{@booking.end_date}", location_start: "#{@booking.location_start}", location_end: "#{@booking.location_end}", chair: "#{@booking.baby_chair}", navigator: "#{@booking.navigator}", days: "#{@booking.days}", total: "#{@booking.total}", deposit: "#{@booking.deposit}", price: "#{@booking.price}" } }.to_json
            req.headers['Content-Type'] = 'application/json'
        end
        logger.info "Faraday create booking" + " resp:" + resp.body.to_s

      else
        #create client and booking
        url_create_client = 'https://api.rentprog.ru/api/v1/create_client'
        resp_create_client = Faraday.post(url_create_client) do |req|
            req.body = { clients: {name: "#{@booking.firstname}", lastname: "#{@booking.lastname}", middlename: "#{@booking.middlename}", phone: "#{@booking.phone}", email: "#{@booking.email}" } }.to_json
            req.headers['Content-Type'] = 'application/json'
        end
        resp_create_client_resp = JSON.parse resp_create_client.body.force_encoding("UTF-8")
        url_create_booking = 'https://api.rentprog.ru/api/v1/create_booking'
        resp_create_booking = Faraday.post(url_create_booking) do |req|
            req.body = { bookings: {company_id: 2, active: "false", client_id: "#{resp_create_client_resp.body.id}", first_name: "#{@booking.firstname}", last_name: "#{@booking.lastname}", middle_name: "#{@booking.middlename}", car_name: "#{@booking.car}", start_date: "#{@booking.start_date}", end_date: "#{@booking.end_date}", location_start: "#{@booking.location_start}", location_end: "#{@booking.location_end}", chair: "#{@booking.baby_chair}", navigator: "#{@booking.navigator}", days: "#{@booking.days}", total: "#{@booking.total}", deposit: "#{@booking.deposit}", price: "#{@booking.price}" } }.to_json
            req.headers['Content-Type'] = 'application/json'
        end
        logger.info "Faraday create client #{resp_create_client_resp.body.id} and booking #{resp_create_booking.body.id}"
      end           
      
      # BookingMailer.with(booking: @booking).user_accept_booking_email.deliver_later
      redirect_back(fallback_location: request.referer, notice: "Заявка одобрена!")
    else
      redirect_back(fallback_location: request.referer, alert: "Что то пошло не так!")
    end
  end

  def toggle_rejection
      @booking.accept = false
      @booking.rejection = false
      if @booking.save!
        redirect_back(fallback_location: request.referer, notice: "Заявка активирована!")
      end
  end

  def rejection_not_cars
    @booking = Booking.find(params[:id])
    @booking.rejection = true
    if @booking.save
      BookingMailer.with(booking: @booking).user_rejection_not_cars_email.deliver_later
      redirect_back(fallback_location: request.referer, notice: "Заявка отклонена!")
    else
      redirect_back(fallback_location: request.referer, alert: "Что то пошло не так!")
    end
  end

  def rejection_few_days
    @booking = Booking.find(params[:id])
    @booking.rejection = true
    if @booking.save
      BookingMailer.with(booking: @booking).user_rejection_few_days_email.deliver_later
      redirect_back(fallback_location: request.referer, notice: "Заявка отклонена!")
    else
      redirect_back(fallback_location: request.referer, alert: "Что то пошло не так!")
    end
  end
  
  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_back(fallback_location: request.referer, notice: "Бронь удалена!")
    end
  end

  def new
    @booking = Booking.new
    if params[:car_id]
      @car = Car.find(params[:car_id])
    else
      @cars = Car.all.sort_by { |obj| obj.id }
    end
  end

  private
    def set_text
      @text = Text.first
    end

    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :location_start, :location_end, 
        :firstname, :lastname, :middlename, :baby_chair, :phone, :email, :car, :navigator, 
        :accept, :price, :total, :deposit, :note, :rejection)
    end
end
