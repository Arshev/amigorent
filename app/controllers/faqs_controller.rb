class FaqsController < ApplicationController
  def index
    @main_up_text = Text.first.main_up_text

    @faqs_title = Text.first.faqs_title
    @faqs_description = Text.first.faqs_description
  end
end
