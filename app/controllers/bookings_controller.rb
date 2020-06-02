class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :update]
  before_action :authenticate_user!, only: [:show, :index]
  before_action :set_text, only: [:success, :new]

  # def create
  #   @booking = Booking.new(booking_params)
  #   if @booking.valid? && @booking.save
  #     redirect_back(fallback_location: success_path, notice: "Заявка успешно создана! Ожидайте звонка оператора. Обработка заявки производится в течение суток")
  #     BookingMailer.with(booking: @booking).new_booking_email.deliver_later
  #     @booking.send_sms
  #     begin
  #       @booking.send_tg_message
  #     rescue => exception
  #         puts exception
  #         logger.debug exception
  #     end
  #   else
  #     redirect_to root_path, alert: "Что то пошло не так!"
  #   end
  # end

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
      params.require(:booking).permit(:start_date, :end_date, :location_start, :location_end, :firstname, :lastname, :middlename, :baby_chair, :phone, :email, :car, :navigator, :accept, :price, :total, :deposit, :note)
    end
end
