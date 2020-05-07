class PricesController < ApplicationController
  def index
    @cars = Car.all
    @main_up_text = Text.first.main_up_text

    @prices_title = Text.first.prices_title
    @prices_description = Text.first.prices_description

    @prices_text = Text.first.prices_text
    @prices_bottom_text = Text.first.prices_bottom_text

    @dop_table_kreslo_dayprice = Text.first.dop_table_kreslo_dayprice
    @dop_table_kreslo_allprice = Text.first.dop_table_kreslo_allprice
    @dop_table_navigator_dayprice = Text.first.dop_table_navigator_dayprice
    @dop_table_downtext = Text.first.dop_table_downtext
  end
end
