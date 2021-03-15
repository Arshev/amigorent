class ReviewsController < ApplicationController

  before_action :set_text, only: [:index]
  invisible_captcha only: [:create], honeypot: :subtitle

  def create
    @review = Review.new(review_params)
    # recaptcha_valid = verify_recaptcha(model:@review)
    # if recaptcha_valid
      if @review.save
        ReviewMailer.with(review: @review).review_email.deliver_later
        redirect_back(fallback_location: request.referer, notice: "Отзыв успешно создан! Он будет проверен на предмет спама и размещен.")
      else
        redirect_back(fallback_location: request.referer, alert: "Что то пошло не так!")
      end
    # else
    #   redirect_back(fallback_location: request.referer, alert: "Вы не прошли проверку на ботов!")
    # end
  end

  def index
    @reviews = Review.paginate(page: params[:page])
    @review = Review.new
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    @reviews = Review.all

    respond_to :js
  end

  def approve
    @review = Review.find(params[:id])
    @review.active = true
    @review.save
    redirect_back(fallback_location: request.referer, notice: "Отзыв одобрен!")
  end

  private
    def review_params
      params.require(:review).permit(:text, :star, :active, :name, :email)
    end

    def set_text
      @text = Text.first
      @cities = City.where(active: true)
    end
end
