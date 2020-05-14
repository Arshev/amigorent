class BookingsController < ApplicationController

  before_action :set_booking, only: [:show]
  before_action :authenticate_user!, only: [:show, :index]

  def create
    @booking = Booking.new(booking_params)
    if @booking.valid? && @booking.save
      redirect_back(fallback_location: success_path, notice: "Заявка успешно создана! Ожидайте звонка оператора. Обработка заявки производится в течение суток")
      # redirect_to success_path, notice: "Заявка успешно создана! Ожидайте звонка оператора. Обработка заявки производится в течение суток"
      @booking.send_sms
      @booking.send_tg_message!
      BookingMailer.with(booking: @booking).new_booking_email.deliver_later
    else
      redirect_to root_path, alert: "Что то пошло не так!"
    end
  end

  def show
  end

  def success
    @success_text = Text.first.success
    @main_up_text = Text.first.main_up_text
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.accept = true
    if @booking.save
      BookingMailer.with(booking: @booking).user_accept_booking_email.deliver_later
      redirect_back(fallback_location: request.referer, notice: "Заявка одобрена!")
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

  def index
    @bookings = Booking.all
  end

  def new
    @bookings_title = Text.first.bookings_title
    @bookings_description = Text.first.bookings_description
    # @cars = Car.all
    @main_up_text = Text.first.main_up_text
    @booking = Booking.new
    if params[:car_id]
      @car = Car.find(params[:car_id])
    else
      @cars = Car.all.sort_by { |obj| obj.id }
      # gon.cars_info = @cars
    end
  end

  private

    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :location_start, :location_end, :firstname, :lastname, :middlename, :baby_chair, :phone, :email, :car, :navigator, :accept, :total, :deposit)
    end
end
