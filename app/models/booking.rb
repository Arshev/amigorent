class Booking < ApplicationRecord
  validates :car, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  default_scope {order('created_at DESC')}

  self.per_page = 10

  def send_sms
    message = MainsmsApi::Message.new(message: "#{self.firstname} авто: #{self.car} тел: #{self.phone} с #{self.start_date} до #{self.end_date}", recipients: ['79022504797'])
    response = message.deliver
  end

  def send_tg_message
    token = Rails.application.credentials.telegram_api_key

    Telegram::Bot::Client.run(token) do |bot|
      bot.api.send_message(chat_id: 251685098, text: "Новая заявка от #{self.firstname} авто: #{self.car} тел: #{self.phone} с #{self.start_date} до #{self.end_date}")
      # bot.listen do |message|
      #   case message.text
      #   when '/start'
      #     bot.api.send_message(chat_id: 251685098, text: "Hello, #{message.from.first_name}")
      #   when '/stop'
      #     bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
      #   end
      # end
    end
  end
end
