class PricesController < ApplicationController
  before_action :set_text
  def index
    @city = City.find_by(name: params[:city]) 
    @cars = Car.all.where(active: true, city: @city ? @city.name : "Калининград")
  end

  private
    def set_text
      @text = Text.first
      @cities = City.where(active: true)
    end
end
