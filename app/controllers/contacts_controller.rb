class ContactsController < ApplicationController
  def index
    @main_up_text = Text.first.main_up_text
  end

  def create
    @contact = {}
    @contact["name"] = params[:name]
    @contact["phone"] = params[:phone]
    @contact["email"] = params[:email]
    @contact["message"] = params[:message]

    if ContactMailer.with(contact: @contact).contact_email.deliver_later
      redirect_back(fallback_location: request.referer, notice: "Сообщение отправлено!")
    else
      redirect_back(fallback_location: request.referer, alert: "Что то не так!")
    end
  end
end
