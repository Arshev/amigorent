class CarsController < ApplicationController
  before_action :set_car, only: %i[destroy show update]
  before_action :set_text,
                only: %i[
                  index
                  show
                  economy
                  middle
                  minivans
                  crossovers
                  business
                  commercial
                ]
  before_action :authenticate_user!,
                except: %i[
                  show
                  index
                  economy
                  middle
                  minivans
                  crossovers
                  business
                  commercial
                ]
  before_action :is_authorised, only: %i[photo_upload update destroy]

  def index
    if params[:start_date] && params[:start_time] && params[:end_date] &&
         params[:end_time] && params[:city]
      start_date = params[:start_date] + ' ' + params[:start_time]
      end_date = params[:end_date] + ' ' + params[:end_time]
      if params[:city] == 'Калининград'
        token = Rails.application.credentials.kaliningrad_rentprog_token
      else
        @city = City.find_by(name: params[:city])
        token = @city.rentprog_token
      end

      # Ищем в системе свободные
      get_free_cars_url =
        "https://api.rentprog.ru/api/v1/get_free_cars?start_date=#{start_date}&end_date=#{end_date}"
      get_free_cars_resp =
        Faraday.get(get_free_cars_url) do |req|
          req.headers['Accept'] = 'application/json'
          req.headers['Content-Type'] = 'application/json'
          req.headers['Authorization'] = "Bearer #{token}"
        end
      get_free_cars_body = []

      # Получаем ids свободных
      if get_free_cars_resp.status == 200
        get_free_cars_body =
          JSON.parse(get_free_cars_resp.body.force_encoding('UTF-8'))
        logger.info get_free_cars_body
      else
        logger.info 'bad response in cars index'
      end

      # Ищем тут
      all_cars = Car.where(active: true, fake: false, city: params[:city])
      cars_ids = []
      if get_free_cars_body.length > 0
        all_cars.each do |car|
          if car.ids_rentprog &&
               car.ids_rentprog.any? { |i| get_free_cars_body.include? i }
            cars_ids.push(car.id)
          end
        end
      end
      @cars = Car.where(id: cars_ids)
      @fake_cars = Car.where(active: true, city: params[:city] ? params[:city] : 'Калининград', ids_rentprog: nil)
    else
      if params[:city] && params[:city] != 'Калининград'
        @city = City.find_by(name: params[:city])
      end
      @cars = Car.where(active: true, city: params[:city] ? params[:city] : 'Калининград')
    end
  end

  def new
    @car = current_user.cars.build
  end

  def create
    @car = current_user.cars.build(car_params)
    if @car.save
      redirect_to cars_admin_path, notice: 'Сохранено'
    else
      redirect_back(fallback_location: request.referer, alert: 'Что то не так!')
    end
  end

  def destroy
    if @car.destroy
      redirect_to root_path, notice: 'Удалено'
    else
      flash[:alert] = 'Что то не так!'
    end
  end

  def show
    if @car.active
      @city = City.find_by(name: @car.city)
      @cars = Car.where(active: true, city: @car.city).sample(3)
      
      @rentprog_token = @city ? @city.rentprog_token : Rails.application.credentials.kaliningrad_rentprog_token
      # @new_review = CarReview.new
      # if @car.city
      #   @main_up_text = Text.first.main_up_text
      #   @city = City.find_by(name: @car.city)
      # end
    else
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
  end

  def economy
    @cars = Car.where(active: true, car_class: 'Эконом', city: 'Калининград')
  end
  def middle
    @cars = Car.where(active: true, car_class: 'Средний', city: 'Калининград')
  end
  def minivans
    @cars = Car.where(active: true, car_class: 'Минивэны', city: 'Калининград')
  end
  def crossovers
    @cars =
      Car.where(active: true, car_class: 'Кроссоверы', city: 'Калининград')
  end
  def business
    @cars = Car.where(active: true, car_class: 'Бизнес', city: 'Калининград')
  end
  def commercial
    @cars =
      Car.where(active: true, car_class: 'Коммерческий', city: 'Калининград')
  end

  def images_upload; end

  def update
    new_params = car_params
    new_params = car_params.merge(active: true) if is_ready_car

    if @car.update(new_params)
      if car_params[:ids_rentprog]
        ids = car_params[:ids_rentprog].gsub(' ', '').split(',')
        @car.update(ids_rentprog: ids)
      end
      flash[:notice] = 'Сохранено'
      logger.info @car.ids_rentprog
    else
      flash[:notice] = 'Что то не так!'
    end
    redirect_back(fallback_location: request.referer)
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def is_authorised
    unless current_user.id == @car.user_id || current_user.is_admin
      redirect_to root_path,
                  alert: 'У вас нет прав на просмотр данной страницы!'
    end
  end

  def is_ready_car
    !@car.active && !@car.price_1.blank? && !@car.price_2.blank? &&
      !@car.price_3.blank? && !@car.price_4.blank? && !@car.price_5.blank? &&
      !@car.price_hour.blank? && !@car.price_main.blank? &&
      !@car.car_name.blank? && @car.images?
  end

  def set_text
    @text = Text.first
    @cities = City.where(active: true)
  end

  def car_params
    params
      .require(:car)
      .permit(
        :car_name,
        :year,
        :color,
        :transmission,
        :is_air,
        :engine_capacity,
        :is_electropackage,
        :car_class,
        :car_type,
        :price_1,
        :price_2,
        :price_3,
        :price_4,
        :price_5,
        :old_price_1,
        :old_price_2,
        :old_price_3,
        :old_price_4,
        :old_price_5,
        :price_hour,
        :price_main,
        :deposit,
        :description,
        :description_en,
        :fuel,
        :number_doors,
        :active,
        :sort,
        :show_on_main,
        :youtube,
        :main_image,
        :power,
        :fuel_type,
        :drive_unit,
        :tth_note,
        :consumption,
        :number_seats,
        :clearance,
        :length,
        :width,
        :height,
        :tank_capacity,
        :trunk_volume,
        :mass,
        :number_gears,
        :max_speed,
        :racing,
        :climat,
        :mirror,
        :power_window_front,
        :power_window_back,
        :steering_wheel_height,
        :steering_wheel_adjustment,
        :power_seats,
        :hot_seats,
        :central_locking,
        :radio,
        :usb,
        :aux,
        :cd,
        :video,
        :city,
        :fake,
        :ids_rentprog,
        images: [],
      )
  end
end
