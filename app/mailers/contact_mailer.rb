class ContactMailer < ApplicationMailer
  default from: 'no-reply@amigorent.ru'

  def contact_email
    @contact = params[:contact]
    mail(to: 'ashev08@gmail.com', subject: 'Сообщение со страницы контактов')
  end
end