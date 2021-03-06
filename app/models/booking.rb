class Booking < ApplicationRecord

  require 'telegram/bot'

  validates :car, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  default_scope {order('created_at DESC')}

  self.per_page = 15

  ransacker :id do
    Arel.sql("to_char(\"#{table_name}\".\"id\", '99999999')")
  end

  def send_sms
    message = MainsmsApi::Message.new(message: "#{self.firstname} авто: #{self.car} тел: #{self.phone} с #{self.start_date} до #{self.end_date}", recipients: ['79217101615'])
    response = message.deliver
  end

  def send_tg_message
    token = Rails.application.credentials.telegram_api_key

    Telegram::Bot::Client.run(token) do |bot|
        # bot.api.send_message(chat_id:430186294, text: "Из большой заявки")
        bot.api.send_message(chat_id:825845493, text: "Новая заявка от #{self.firstname} авто: #{self.car} тел: #{self.phone} с #{self.start_date} до #{self.end_date}") 
    end
  end
end
