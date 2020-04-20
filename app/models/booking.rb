class Booking < ApplicationRecord

  default_scope {order('created_at DESC')}

  self.per_page = 10

  def send_sms
    message = MainsmsApi::Message.new(message: "#{self.firstname} авто: #{self.car} тел: #{self.phone} с #{self.start_date} до #{self.end_date}", recipients: ['79022504797'])
    response = message.deliver
  end
end
