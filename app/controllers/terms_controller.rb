class TermsController < ApplicationController
  before_action :set_text

  def index
  end

  private
    def set_text
      @text = Text.first
    end
end
