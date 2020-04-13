class QuickBooking < ApplicationRecord
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  def send_sms
    message = MainsmsApi::Message.new(message: "Новая заявка от #{self.name},#{self.phone},с #{self.start_date} до #{self.end_date} кузов: #{('Седан' if self.is_sedan) || ('Хетчбэк' if self.is_hatch) || ('Кроссовер' if self.is_cross) || ('Минивен' if self.is_minivan) || ('Универсал' if self.is_universal)}", recipients: ['79022504797'])
    response = message.deliver
  end
end
