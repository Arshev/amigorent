class DeliveriesController < ApplicationController
  # before_action :set_delivery, except: [:index, :create]
  before_action :authenticate_user!, except: [:show, :index, :aeroport, :zelenogradsk, :svetlogorsk, :yantarnyi, :baltyisk, :pionerskyi, :chernyahovsk]
  before_action :is_authorised, only: [:update, :destroy]
  before_action :set_city, only: [:aeroport, :zelenogradsk, :svetlogorsk, :yantarnyi, :baltyisk, :pionerskyi, :chernyahovsk]
  before_action :set_text, only: [:index, :show]

  def aeroport
    @cities = City.where(active: true)
  end
  def zelenogradsk
    @cities = City.where(active: true)
  end
  def svetlogorsk
    @cities = City.where(active: true)
  end
  def yantarnyi
    @cities = City.where(active: true)
  end
  def baltyisk
    @cities = City.where(active: true)
  end
  def pionerskyi
    @cities = City.where(active: true)
  end
  def chernyahovsk
    @cities = City.where(active: true)
  end
  

  def index
  end

  def create
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
      redirect_to deliveries_admin_path, notice: "Сохранено"
    else
      redirect_back(fallback_location: request.referer, alert: "Что то не так!")
    end
  end

  def update
    if @delivery.update(delivery_params)
      flash[:notice] = "Сохранено"
    else
      flash[:notice] = "Что то не так!"
    end
    redirect_back(fallback_location: request.referer)
  end

  def destroy
    if @delivery.destroy
      redirect_back(fallback_location: request.referer, notice: "Удалено")
    else
      flash[:alert] = "Что то не так!"
    end
  end

  def show
  end
  
  private
    def delivery_params
      params.require(:delivery).permit(:city, :text, :price_work_time, :price_not_work_time, :h1, :title,
        :description, :background)
    end

    def set_text
      @text = Text.first
      @cities = City.where(active: true)
    end

    def set_city
      @main_up_text = Text.first.main_up_text
      @text = Text.first
      @cars = Car.where(active: true).sample(9)
    end
    

    def set_delivery
      @delivery = Delivery.find(params[:id])
    end

    def is_authorised
      redirect_to root_path, alert: "У вас нет прав на просмотр данной страницы!" unless current_user.is_admin
    end
end
