class PricesController < ApplicationController
  def index
    @cars = Car.all
    @main_up_text = Text.first.main_up_text
    @prices_text = Text.first.prices_text
    @prices_bottom_text = Text.first.prices_bottom_text
  end
end
