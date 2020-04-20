class PricesController < ApplicationController
  def index
    @cars = Car.all
    @main_up_text = Text.first.main_up_text

    @prices_title = Text.first.prices_title
    @prices_description = Text.first.prices_description

    @prices_text = Text.first.prices_text
    @prices_bottom_text = Text.first.prices_bottom_text
  end
end
