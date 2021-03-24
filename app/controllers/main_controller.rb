class MainController < ApplicationController
  before_action :set_text
  def index
    @quick_booking = QuickBooking.new
    @reviews = Review.where(active: :true).limit(3)

    @cars = Car.all.where(active: true, city: "Калининград").sample(3)
  end

  def conditions
  end

  def s_voditelem
  end
  def car_sharing
  end
  def casko
  end
  def corporate
  end
  def sales
  end
  def payment
  end
  def outsours
  end
  def full_insurance
  end

  private
    def set_text
      @text = Text.first
      @cities = City.where(active: true)
    end
end
