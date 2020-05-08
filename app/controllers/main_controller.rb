class MainController < ApplicationController
  before_action :set_up_text
  before_action :set_text, only: [:s_voditelem, :car_sharing, :casko, :corporate, :sales, :payment, :outsours]
  def index
    @quick_booking = QuickBooking.new
    @reviews = Review.where(active: :true).limit(3)

    @main_title = Text.first.main_title
    @main_description = Text.first.main_description

    @cars = Car.all.limit(3) # On main
    @main_h1_text = Text.first.main_h1_text
    @main_quick_booking_text = Text.first.main_quick_booking_text
    @main_substances_text = Text.first.main_substances_text
    @main_car_list_text = Text.first.main_car_list_text
    @main_services_text = Text.first.main_services_text
    @main_mission_text = Text.first.main_mission_text
    @main_edge_text = Text.first.main_edge_text
    @footer_text = Text.first.footer_text
    @home_title = Text.first.main_title
    @home_description = Text.first.main_description
  end

  def conditions
    @conditions_text = Text.first.conditions
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

  private
    def set_up_text
      @main_up_text = Text.first.main_up_text
    end
    def set_text
      @text = Text.first
    end
end
