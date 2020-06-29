class QuickBookingsController < ApplicationController

  def create
    @quick_booking = QuickBooking.create(quick_booking_params)
    if @quick_booking.save
      @quick_booking.send_sms
      begin
        @quick_booking.send_tg_message
      rescue => exception
        puts exception
        logger.debug exception
      end
      QuickBookingMailer.with(quick_booking: @quick_booking).new_quick_booking_email.deliver_later

      redirect_to success_path, notice: "Заявка успешно создана! Ожидайте звонка оператора. Обработка заявки производится в течение суток"
    else
      redirect_to root_path, alert: "Что то пошло не так!"
    end
  end

  private

    def quick_booking_params
      params.require(:quick_booking).permit(:start_date, :end_date, :name, :phone, :email, :is_sedan, :is_hatch, :is_cross, :is_minivan, :is_universal)
    end
end
