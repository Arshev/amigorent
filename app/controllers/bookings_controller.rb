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
      BookingMailer.with(booking: @booking).user_accept_booking_email.deliver_later
      redirect_back(fallback_location: request.referer, notice: "Заявка одобрена!")
    else
      redirect_back(fallback_location: request.referer, alert: "Что то пошло не так!")
    end
  end

  def toggle_rejection
    if @booking.toggle!(:rejection) && @booking.toggle!(:accept)
      redirect_back(fallback_location: request.referer, notice: "Заявка активирована!")
    else
      redirect_back(fallback_location: request.referer, alert: "Что то пошло не так!")
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
