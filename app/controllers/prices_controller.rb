class PricesController < ApplicationController
  before_action :set_text
  def index
    @cars = Car.all
  end

  private
    def set_text
      @text = Text.first
    end
end
