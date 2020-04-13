class MainController < ApplicationController
  def index
    @quick_booking = QuickBooking.new
  end
end
