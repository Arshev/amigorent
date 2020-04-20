class AboutsController < ApplicationController
  def index
    @main_up_text = Text.first.main_up_text
    @about_text = Text.first.about_text
    @abouts_title = Text.first.abouts_title
    @abouts_description = Text.first.abouts_description
  end
end
