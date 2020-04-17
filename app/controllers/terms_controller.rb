class TermsController < ApplicationController
  def index
    @main_up_text = Text.first.main_up_text
    @terms_text = Text.first.terms_text
  end
end
