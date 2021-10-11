# encoding: utf-8
require 'telegram/bot'
class CallBookingJob < ApplicationJob
  queue_as :default

  def perform(data)
    begin
      token = Rails.application.credentials.telegram_api_key

      Telegram::Bot::Client.run(token) do |bot|
        # bot.api.send_message(chat_id:430186294, text: "Из большой заявки")
        bot.api.send_message(
          chat_id: 825_845_493,
          text:
            "Запрос звонка от #{data[:name] ? data[:name] : 'Нет имени'} тел: #{data[:phone]}, текст: #{data[:text]}",
        )
      end
      BookingMailer
        .with(name: data[:name], phone: data[:phone], text: data[:text])
        .call_booking_email
        .deliver_later
    rescue => exception
      ErrorMailer
        .with(status: 'exception', data: data, text: exception)
        .error_call_booking_email
        .deliver_later
      Rails.logger.info exception
    end
  end
end
