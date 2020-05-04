class DeliveriesController < ApplicationController
  # before_action :set_delivery, except: [:index, :create]
  before_action :authenticate_user!, except: [:show, :index, :aeroport, :zelenogradsk, :svetlogorsk, :yantarnyi, :baltiysk, :pionerskyi, :chernyahovsk]
  before_action :is_authorised, only: [:update, :destroy]
  before_action :set_city, only: [:aeroport, :zelenogradsk, :svetlogorsk, :yantarnyi, :baltyisk, :pionerskyi, :chernyahovsk]

  def aeroport
  end
  def zelenogradsk
  end
  def svetlogorsk
  end
  def yantarnyi
  end
  def baltyisk
  end
  def pionerskyi
  end
  def chernyahovsk
  end
  

  def index
    @text = Text.first
    @main_up_text = Text.first.main_up_text

    @deliveries_title = Text.first.deliveries_title
    @deliveries_description = Text.first.deliveries_description

    @dop_table_worktime = Text.first.dop_table_worktime
    @dop_table_endtime = Text.first.dop_table_endtime
    @dop_table_city_price_worktime = Text.first.dop_table_city_price_worktime
    @dop_table_city_price_endtime = Text.first.dop_table_city_price_endtime
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
    @delivery_title = Text.first.delivery_title + " " + @delivery.city
    @delivery_description = Text.first.delivery_description + " " + @delivery.city

    @dop_table_worktime = Text.first.dop_table_worktime
    @dop_table_endtime = Text.first.dop_table_endtime
  end
  
  private
    def delivery_params
      params.require(:delivery).permit(:city, :text, :price_work_time, :price_not_work_time, :h1, :title,
        :description, :background)
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
