class MainController < ApplicationController
  before_action :set_text
  def index
    # @quick_booking = QuickBooking.new
    @reviews = Review.where(active: :true).limit(3)

    @cars = Car.all.where(active: true, show_on_main: true, city: "Калининград")
  end

  def conditions
  end

  def s_voditelem
    if params[:city]
      @city = City.find_by(name: params[:city])
    end
  end
  def car_sharing
    if params[:city]
      @city = City.find_by(name: params[:city])
    end
  end
  def casko
    if params[:city]
      @city = City.find_by(name: params[:city])
    end
  end
  def corporate
    if params[:city]
      @city = City.find_by(name: params[:city])
    end
  end
  def sales
    if params[:city]
      @city = City.find_by(name: params[:city])
    end
  end
  def payment
    if params[:city]
      @city = City.find_by(name: params[:city])
    end
  end
  def partners
    if params[:city]
      @city = City.find_by(name: params[:city])
    end
  end
  def franchise
    if params[:city]
      @city = City.find_by(name: params[:city])
    end
  end
  def outsours
    if params[:city]
      @city = City.find_by(name: params[:city])
    end
  end
  def full_insurance
    if params[:city]
      @city = City.find_by(name: params[:city])
    end
  end

  private
    def set_text
      @text = Text.first
      @cities = City.where(active: true)
    end
end
