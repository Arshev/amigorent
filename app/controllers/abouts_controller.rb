class AboutsController < ApplicationController
  before_action :set_text

  def index
  end

  private

  def set_text
    @text = Text.first
    @cities = City.where(active: true)
    @city = City.find_by(name: params[:city])
  end
end
