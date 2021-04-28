class TownsController < ApplicationController
    before_action :authenticate_user!, except: [:show, :index]
    before_action :is_authorised, only: [:update, :destroy]
    before_action :set_text, only: [:index, :show]
    before_action :set_town, only: [:show]
    
  
    def index
    end
  
    def create
      @town = City.find(params[:city_id]).towns.new(town_params)
      if @town.save!
        redirect_to new_cities_admin_path, notice: "Сохранено"
      else
        redirect_back(fallback_location: request.referer, alert: "Что то не так!")
      end
    end
  
    def update
        @town = Town.find(params[:id])
        if @town.update(town_params)
            flash[:notice] = "Сохранено"
        else
            flash[:notice] = "Что то не так!"
        end
        redirect_back(fallback_location: request.referer)
    end

    def activate
      @town = Town.find(params[:id])
      if @town.update(active: true)
        redirect_to new_cities_admin_path, notice: "Город активирован"
      else
        flash[:alert] = "Что то не так!"
      end
    end

    def deactivate
      @town = Town.find(params[:id])
      if @town.update(active: false)
        redirect_to new_cities_admin_path, notice: "Город деактивирован"
      else
        flash[:alert] = "Что то не так!"
      end
    end
  
    def destroy
        @town = Town.find(params[:id])
      if @town.destroy
        redirect_to new_cities_admin_path, notice: "Удалено"
      else
        flash[:alert] = "Что то не так!"
      end
    end
  
    def show
    end

    def address_town
      @cities = City.where(active: true)
      @main_up_text = Text.first.main_up_text
      @town = Town.find_by(url_name: params[:town_name])
      @city = @town.city
      @cars = Car.where(active: true, city: @city.name).sample(9)
    end
    
    private
      def town_params
        params.require(:town).permit(:name, :url_name, :text, :h1, :title, :description, :phone, :email, :address, :text, :yandex, :google, :work_time, :background)
      end
  
      def set_text
        @text = Text.first
        @cities = City.where(active: true)
      end
  
      def set_town
        @main_up_text = Text.first.main_up_text
        @town = Town.find(params[:id])
        @cars = Car.where(active: true, city: @town.city.name).sample(9)
      end
  
      def is_authorised
        redirect_to root_path, alert: "У вас нет прав на просмотр данной страницы!" unless current_user.is_admin
      end
  end
  