class BookingMailer < ApplicationMailer
  default from: 'no-reply@amigorent.ru'

  def new_booking_email
    @booking = params[:booking]
    mail(to: 'amigo.rent@ya.ru', subject: 'Новая заявка на бронирование')
  end

  def user_accept_booking_email
    @booking = params[:booking]
    mail(to: @booking.email, subject: 'Подтверждение заявки на бронирование')
  end

  def user_rejection_not_cars_email
    @booking = params[:booking]
    mail(to: @booking.email, subject: 'Ваша заявка на бронирование отклонена')
  end

  def user_rejection_few_days_email
    @booking = params[:booking]
    mail(to: @booking.email, subject: 'Ваша заявка на бронирование отклонена')
  end
end
