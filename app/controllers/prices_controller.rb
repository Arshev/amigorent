class PricesController < ApplicationController
  before_action :set_text
  def index
    @cars = Car.all.where(active: true, city: "Калининград")
  end

  private
    def set_text
      @text = Text.first
      @cities = City.where(active: true)
    end
end
