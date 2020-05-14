class Booking < ApplicationRecord

  require 'telegram/bot'

  validates :car, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  default_scope {order('created_at DESC')}

  self.per_page = 10

  def send_sms
    message = MainsmsApi::Message.new(message: "#{self.firstname} авто: #{self.car} тел: #{self.phone} с #{self.start_date} до #{self.end_date}", recipients: ['79217101615'])
    response = message.deliver
  end

  def send_tg_message
    token = Rails.application.credentials.telegram_api_key

    Telegram::Bot::Client.run(token) do |bot|
        bot.api.send_message(chat_id:430186294, text: "Новая заявка от #{self.name},#{self.phone},с #{self.start_date} до #{self.end_date} кузов: #{('Седан' if self.is_sedan) || ('Хетчбэк' if self.is_hatch) || ('Кроссовер' if self.is_cross) || ('Минивен' if self.is_minivan) || ('Универсал' if self.is_universal)}") 
    end
  end
end
