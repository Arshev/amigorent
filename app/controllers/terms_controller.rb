class TermsController < ApplicationController
  before_action :set_text
  def index
    @main_up_text = Text.first.main_up_text

    @terms_title = Text.first.terms_title
    @terms_description = Text.first.terms_description

    @terms_text = Text.first.terms_text
  end

  private

    def set_text
      @text = Text.first
    end
    
end
