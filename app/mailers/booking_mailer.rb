class BookingMailer < ApplicationMailer
  default from: 'no-reply@amigorent.ru'

  def new_booking_email
    @booking = params[:booking]
    mail(to: 'ashev08@gmail.com', subject: 'Новая заявка на бронирование')
  end

  def user_accept_booking_email
    @booking = params[:booking]
    mail(to: @booking.email, subject: 'Подтверждение заявки на бронирование')
  end
end