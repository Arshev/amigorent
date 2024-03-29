class ContactsController < ApplicationController
  before_action :set_text, only: [:index]

  invisible_captcha only: [:create], honeypot: :subtitle, on_spam: :spam_callback

  def index
    @main_up_text = Text.first.main_up_text

    @contacts_title = Text.first.contacts_title
    @contacts_description = Text.first.contacts_description
    @city = City.find_by(name: params[:city])
  end

  def create
    # @contact_model = Contact.new(email: "test@test.ru", text: "text test")
    # recaptcha_valid = verify_recaptcha(action: 'demo_a', minimum_score: 0.2)
    # if recaptcha_valid
      @contact = {}
      @contact["name"] = params[:name]
      @contact["phone"] = params[:phone]
      @contact["email"] = params[:email]
      @contact["message"] = params[:message]

      ContactMailer.with(contact: @contact).contact_email.deliver_later
      redirect_to contacts_path, notice: "Сообщение отправлено!"
        # redirect_back(fallback_location: request.referer, notice: "Сообщение отправлено!")
    # else 
    #   redirect_to contacts_path, alert: "Что то не так!"
    #   # redirect_back(fallback_location: request.referer, alert: "Что то не так!")
    # end
  end

  private

  def spam_callback
    redirect_to contacts_path, alert: "Вы похожи на робота!"
  end
  def set_text
    @text = Text.first
    @cities = City.where(active: true)
  end
  
end
