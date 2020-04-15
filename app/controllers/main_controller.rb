class MainController < ApplicationController
  def index
    @quick_booking = QuickBooking.new
    @reviews = Review.where(active: :true).limit(3)
  end
end
