class ContactsController < ApplicationController
  def index
    @main_up_text = Text.first.main_up_text

    @contacts_title = Text.first.contacts_title
    @contacts_description = Text.first.contacts_description
  end

  def create
    success = verify_recaptcha(action: 'create', minimum_score: 0.5)
    checkbox_success = verify_recaptcha unless success
    if success || checkbox_success
      @contact = Contact.create(contact_params)
      ContactMailer.with(contact: @contact).contact_email.deliver_later
      redirect_back(fallback_location: request.referer, notice: "Сообщение отправлено!")
    else 
      if !success
        @show_checkbox_recaptcha = true
      end
      redirect_back(fallback_location: request.referer, alert: "Что то не так!")
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :message)
    end
end
