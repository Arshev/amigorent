class Api::V1::BookingController < ApiController
    def create
        @booking = Booking.new(booking_params)
        if @booking.save
            # redirect_back(fallback_location: success_path, notice: "Заявка успешно создана! Ожидайте звонка оператора. Обработка заявки производится в течение суток")
            # @booking.send_sms
            begin
                @booking.send_tg_message
            rescue => exception
                puts exception
                logger.debug exception
            end
            BookingMailer.with(booking: @booking).new_booking_email.deliver_later

            # Create Client on RentProg.ru
            begin
                url = 'https://api.rentprog.ru/api/v1/create_client'
                request = {"client":{"name": @booking.firstname, "lastname": @booking.lastname, "middlename": @booking.middlename, "phone": @booking.phone, "email": @booking.email}}
                resp = Faraday.post(url, "'" + request + "'",
                    "Content-Type" => "application/json")
                puts resp
            rescue => exception
                puts exception
                logger.debug exception
            end

            
            render json: @booking, adapter: :json, status: :created
        else
            render json: { error: @booking.errors }, status: :unprocessable_entity
        end
    end

    private
    def booking_params
        params.require(:booking).permit(:start_date, :end_date, :location_start, :location_end, :firstname, :lastname, :middlename, :baby_chair, :phone, :email, :car, :navigator, :days, :price, :accept, :total, :deposit)
    end
end
