class ContactsController < ApplicationController
  def index
    @main_up_text = Text.first.main_up_text

    @contacts_title = Text.first.contacts_title
    @contacts_description = Text.first.contacts_description
  end

  def create
    recaptcha_valid = verify_recaptcha(action: 'create')
    if recaptcha_valid
      @contact = {}
      @contact["name"] = params[:name]
      @contact["phone"] = params[:phone]
      @contact["email"] = params[:email]
      @contact["message"] = params[:message]

      ContactMailer.with(contact: @contact).contact_email.deliver_later
      redirect_to contacts_path, notice: "Сообщение отправлено!"
        redirect_back(fallback_location: request.referer, notice: "zСообщение отправлено!")
    else 
      redirect_back(fallback_location: request.referer, alert: "Что то не так!")
    end
  end
end
