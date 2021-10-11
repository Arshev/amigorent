class ErrorMailer < ApplicationMailer
  default from: 'noreply@amigorent.ru'

  def error_call_booking_email
    @status = params[:status]
    @data = params[:data]
    @text = params[:text]
    mail(to: 'ashev08@gmail.com', subject: 'Ошибка TG в Amigorent')
  end
end
