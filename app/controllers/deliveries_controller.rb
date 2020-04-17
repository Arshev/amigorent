class DeliveriesController < ApplicationController
  before_action :set_delivery, except: [:index, :create]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :is_authorised, only: [:update, :destroy]

  def index
    @deliveries = Delivery.all
    @main_up_text = Text.first.main_up_text
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
    @dop_table_worktime = Text.first.dop_table_worktime
    @dop_table_endtime = Text.first.dop_table_endtime
  end
  
  private
    def delivery_params
      params.require(:delivery).permit(:city, :text, :price_work_time, :price_not_work_time, :h1, :title,
        :description, :background)
    end

    def set_delivery
      @delivery = Delivery.find(params[:id])
    end

    def is_authorised
      redirect_to root_path, alert: "У вас нет прав на просмотр данной страницы!" unless current_user.is_admin
    end
end
