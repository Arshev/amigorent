class ServicesController < ApplicationController
  def index
    @main_up_text = Text.first.main_up_text

    @services_title = Text.first.services_title
    @services_description = Text.first.services_description

    @dop_table_kreslo_dayprice = Text.first.dop_table_kreslo_dayprice
    @dop_table_kreslo_allprice = Text.first.dop_table_kreslo_allprice
    @dop_table_navigator_dayprice = Text.first.dop_table_navigator_dayprice
    @dop_table_downtext = Text.first.dop_table_downtext
  end
end
