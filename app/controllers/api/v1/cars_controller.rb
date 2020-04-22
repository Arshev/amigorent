class Api::V1::CarsController < ApiController

    before_action :set_car, only: [:show]
    before_action :set_cars, only: [:index]

    def show
        render json: @car
    end

    def index
        render json: @cars
    end

    private
        def set_car
            @car = Car.find(params[:id])
        end
        def set_cars
            @cars = Car.where(active: true)
        end
        def car_params
            params.require(:car).permit(:car_name, :year, :color, :transmission, :is_air, :engine_capacity, :is_electropackage, :car_class, :car_type, :price_1, :price_2, :price_3, :price_4, :price_5, :old_price_1, :old_price_2, :old_price_3, :old_price_4, :old_price_5, :price_hour, :price_main, :deposit, :description, :fuel, :number_doors, :active, :sort)
        end
  end
