class AdminsController < ApplicationController
  require 'uri'
  require 'net/http'
  before_action :authenticate_user!
  before_action :is_authorised
  before_action :set_text,
                only: %i[
                  text_main
                  text_other
                  text_metatags
                  cities
                  text_pages
                  translations
                ]
  before_action :set_car, only: %i[edit_car upload_photos copy_car]
  before_action :set_booking, only: [:edit_booking]
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
    # @bookings = Booking.paginate(page: params[:page])
    @q = Booking.ransack(params[:q])
    params[:q][:start_date_formated_lteq] =
      params[:q][:start_date_formated_lteq].to_datetime.end_of_day if !(
      params[:q] && params[:q][:start_date_formated_lteq]
    ).blank?
    if !(params[:q] && params[:q][:start_date_formated_lteq]).blank?
      puts params[:q][:start_date_formated_lteq]
    end
    params[:q][:start_date_formated_gteq] =
      params[:q][:start_date_formated_gteq].to_datetime.end_of_day if !(
      params[:q] && params[:q][:start_date_formated_gteq]
    ).blank?
    if !(params[:q] && params[:q][:start_date_formated_gteq]).blank?
      puts params[:q][:start_date_formated_gteq]
    end
    params[:q][:end_date_formated_lteq] =
      params[:q][:end_date_formated_lteq].to_datetime.end_of_day if !(
      params[:q] && params[:q][:end_date_formated_lteq]
    ).blank?
    if !(params[:q] && params[:q][:end_date_formated_lteq]).blank?
      puts params[:q][:end_date_formated_lteq]
    end
    params[:q][:end_date_formated_gteq] =
      params[:q][:end_date_formated_gteq].to_datetime.end_of_day if !(
      params[:q] && params[:q][:end_date_formated_gteq]
    ).blank?
    if !(params[:q] && params[:q][:end_date_formated_gteq]).blank?
      puts params[:q][:end_date_formated_gteq]
    end
    @bookings = @q.result.paginate(page: params[:page])
  end

  def edit_booking; end

  def new_car
    @car = current_user.cars.build
    @cities = City.all.map { |city| [city.name, city.name] }
    @cities = @cities.push(%w[Калининград Калининград])
  end
  def edit_car
    @cities = City.all.map { |city| [city.name, city.name] }
    @cities = @cities.push(%w[Калининград Калининград])
  end
  def copy_car
    new_car = @car.dup
    new_car.active = false
    if new_car.save
      flash[:notice] = "Сохранено"
      redirect_to cars_admin_path
    else
      flash[:alert] = "Что то не так!"
    end
  end
  def upload_photos; end
  def deliveries
    @deliveries = Delivery.all
  end
  def new_delivery
    @delivery = Delivery.new
  end
  def edit_delivery; end
  def articles
    @articles = Article.all
  end
  def new_article
    @article = Article.new
  end
  def edit_article; end
  def text_main; end
  def text_other; end
  def text_metatags; end
  def text_pages; end
  def cities; end
  def reviews
    @reviews = CarReview.all
    render 'admins/reviews/index'
  end
  def translations; end

  def add_new_city
    @city = City.new
  end

  def add_new_town
    @city = City.find(params[:city_id])
    @town = @city.towns.new
  end

  def new_city
    @city = City.find(params[:id])
  end

  def new_town
    @town = Town.find(params[:id])
  end

  def new_cities
    @cities = City.all
  end

  def new_towns
    @towns = Town.all
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end
  def set_booking
    @booking = Booking.find(params[:id])
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
    unless current_user.is_admin?
      redirect_to root_path,
                  alert: 'У вас нет прав на просмотр данной страницы!'
    end
  end
end
