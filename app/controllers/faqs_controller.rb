class FaqsController < ApplicationController
  def index
    @main_up_text = Text.first.main_up_text
  end
end
