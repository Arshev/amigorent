class CarsController < ApplicationController
  before_action :set_car, only: [:destroy, :show, :update]
  before_action :set_text, only: [:index, :show, :economy, :middle, :minivans, :crossovers, :business, :commercial]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :is_authorised, only: [:photo_upload, :update, :destroy]

  def index
    @cars = Car.where(active: true)
  end

  def new
    @car = current_user.cars.build
  end

  def create
    @car = current_user.cars.build(car_params)
    if @car.save
      redirect_to cars_admin_path, notice: "Сохранено"
    else
      redirect_back(fallback_location: request.referer, alert: "Что то не так!")
    end
  end

  def destroy
    if @car.destroy
      redirect_to root_path, notice: "Удалено"
    else
      flash[:alert] = "Что то не так!"
    end
  end

  def show
    @reviews = @car.car_reviews.limit(10)
    @new_review = CarReview.new
  end

  def economy
    @cars = Car.where(active: true, car_class: "Эконом")
  end
  def middle
    @cars = Car.where(active: true, car_class: "Средний")
  end
  def minivans
    @cars = Car.where(active: true, car_class: "Минивены")
  end
  def crossovers
    @cars = Car.where(active: true, car_class: "Кроссоверы")
  end
  def business
    @cars = Car.where(active: true, car_class: "Бизнес")
  end
  def commercial
    @cars = Car.where(active: true, car_class: "Коммерческий")
  end
  
  def images_upload
  end

  def update
    new_params = car_params
    new_params = car_params.merge(active: true) if is_ready_car

    if @car.update(new_params)
      flash[:notice] = "Сохранено"
    else
      flash[:notice] = "Что то не так!"
    end
    redirect_back(fallback_location: request.referer)
  end

  private

    def set_car
      @car = Car.find(params[:id])
    end

    def is_authorised
      redirect_to root_path, alert: "У вас нет прав на просмотр данной страницы!" unless current_user.id == @car.user_id || current_user.is_admin
    end

    def is_ready_car
      !@car.active && !@car.price_1.blank? && !@car.price_2.blank? && !@car.price_3.blank? && !@car.price_4.blank? && !@car.price_5.blank? && !@car.price_hour.blank? && !@car.price_main.blank? && !@car.car_name.blank? && @car.images?
    end

    def set_text
      @text = Text.first
    end

    def car_params
      params.require(:car).permit(:car_name, :year, :color, :transmission, :is_air, :engine_capacity, 
      :is_electropackage, :car_class, :car_type, :price_1, :price_2, :price_3, :price_4, :price_5, 
      :old_price_1, :old_price_2, :old_price_3, :old_price_4, :old_price_5, :price_hour, :price_main, 
      :deposit, :description, :description_en, :fuel, :number_doors, :active, :sort, :show_on_main, :youtube, :main_image, 
      :power, :fuel_type, :drive_unit, :tth_note, :consumption, :number_seats, :clearance, :length, :width, :height, 
      :tank_capacity, :trunk_volume, :mass, :number_gears, :max_speed, :racing, :climat, :mirror, 
      :power_window_front, :power_window_back, :steering_wheel_height, :steering_wheel_adjustment, 
      :power_seats, :hot_seats, :central_locking, :radio, :usb, :aux, :cd, :video, images: [])
    end
end
