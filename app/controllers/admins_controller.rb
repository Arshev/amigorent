class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_authorised
  before_action :set_text, only: [:text_main, :text_other, :text_metatags, :cities]
  before_action :set_car, only: [:edit_car, :upload_photos]
  before_action :set_delivery, only: [:edit_delivery]
  before_action :set_article, only: [:edit_article]

  def show
    @rating = Rating.first
    @rating_new = Rating.new
  end
  def cars
    @cars = Car.all
  end
  def bookings
    @bookings = Booking.paginate(page: params[:page])
  end
  def new_car
    @car = current_user.cars.build
  end
  def edit_car
  end
  def upload_photos
  end
  def deliveries
    @deliveries = Delivery.all
  end
  def new_delivery
    @delivery = Delivery.new
  end
  def edit_delivery
  end
  def articles
    @articles = Article.all
  end
  def new_article
    @article = Article.new
  end
  def edit_article
  end
  def text_main
  end
  def text_other
  end
  def text_metatags
  end
  def cities
  end

  private

    def set_car
      @car = Car.find(params[:id])
    end
    def set_delivery
      @delivery = Delivery.find(params[:id])
    end
    def set_article
      @article = Article.find(params[:id])
    end
    def set_text
      @text = Text.first
    end
    def is_authorised
      redirect_to root_path, alert: "У вас нет прав на просмотр данной страницы!" unless current_user.is_admin?
    end
end
