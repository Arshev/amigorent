class ContactsController < ApplicationController
  def index
    @main_up_text = Text.first.main_up_text

    @contacts_title = Text.first.contacts_title
    @contacts_description = Text.first.contacts_description
  end

  def create
    recaptcha_valid = verify_recaptcha
    if true
      @contact = {}
      @contact["name"] = params[:name]
      @contact["phone"] = params[:phone]
      @contact["email"] = params[:email]
      @contact["message"] = params[:message]

      ContactMailer.with(contact: @contact).contact_email.deliver_later
      redirect_to contacts_path, notice: "Сообщение отправлено!"
        # redirect_back(fallback_location: request.referer, notice: "Сообщение отправлено!")
    else 
      redirect_to contacts_path, alert: "Что то не так!"
      # redirect_back(fallback_location: request.referer, alert: "Что то не так!")
    end
  end
end
