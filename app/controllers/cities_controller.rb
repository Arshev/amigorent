class CitiesController < ApplicationController
    # before_action :authenticate_user!, except: [:show, :index]
    before_action :is_authorised, only: [:update, :destroy]
    before_action :set_text, only: [:index, :show]
    before_action :set_city, only: [:show]
    
  
    def index
    end
  
    def create
      @city = City.new(city_params)
      if @city.save
        redirect_to new_cities_admin_path, notice: "Сохранено"
      else
        redirect_back(fallback_location: request.referer, alert: "Что то не так!")
      end
    end
  
    def update
        @city = City.find(params[:id])
        if @city.update(city_params)
            flash[:notice] = "Сохранено"
        else
            flash[:notice] = "Что то не так!"
        end
        redirect_back(fallback_location: request.referer)
    end
  
    def destroy
        @city = City.find(params[:id])
        logger.info @city.name
      if @city.destroy
        redirect_to new_cities_admin_path, notice: "Удалено"
      else
        flash[:alert] = "Что то не так!"
      end
    end
  
    def show
      @cars = Car.where(active: true, city: @city.name).sample(3)
    end

    def activate
      @city = City.find(params[:id])
      if @city.update(active: true)
        redirect_to new_cities_admin_path, notice: "Город активирован"
      else
        flash[:alert] = "Что то не так!"
      end
    end

    def deactivate
      @city = City.find(params[:id])
      if @city.update(active: false)
        redirect_to new_cities_admin_path, notice: "Город деактивирован"
      else
        flash[:alert] = "Что то не так!"
      end
    end

    def address_city
      @cities = City.where(active: true)
      @main_up_text = Text.first.main_up_text
      @city = City.find_by(url_name: params[:city_name])
      @towns = @city.towns
      @cars = Car.where(active: true, city: @city.name).limit(9)
    end
    
    private
      def city_params
        params.require(:city).permit(:name, :name_en, :url_name, :text, :h1, :title, :description, :text_en, :h1_en, :title_en, :description_en, :phone, :email, :address, :address_en, :yandex, :google, :work_time, :background, :rentprog_token)
      end
  
      def set_text
        @text = Text.first
        @cities = City.where(active: true)
      end
  
      def set_city
        @main_up_text = Text.first.main_up_text
        @city = City.find(params[:id])
        @towns = @city.towns
        @cars = Car.where(active: true, city: @city.name).sample(9)
      end
  
      def is_authorised
        redirect_to root_path, alert: "У вас нет прав на просмотр данной страницы!" unless current_user.is_admin
      end
  end
  