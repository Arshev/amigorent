class CarReviewsController < ApplicationController
  before_action :set_car, only: [:create, :destroy, :approve, :destroy_from_admin]
  
  def create
    @review = @car.car_reviews.new(review_params)
    recaptcha_valid = verify_recaptcha(model:@review, action: 'create', turbolinks:false)
    if recaptcha_valid
      if @review.save!
        ReviewMailer.with(review: @review).car_review_email.deliver_later
        redirect_back(fallback_location: request.referer, notice: "Отзыв успешно создан! Он будет проверен на предмет спама и размещен.")
      else
        redirect_back(fallback_location: request.referer, alert: "Что то пошло не так!")
      end
    else
      redirect_back(fallback_location: request.referer, alert: "Вы не прошли проверку на ботов!")
    end
  end

  def destroy
    @reviews = @car.car_reviews
    @review = @reviews.find(params[:id])
    @review.destroy

    @reviews = @car.car_reviews

    respond_to do |format|
      format.html { redirect_back(fallback_location: request.referer, notice: "Отзыв удален!") }
      format.js
    end
  end

  def approve
    @review = @car.car_reviews.find(params[:id])
    @review.active = true
    @review.save
    redirect_back(fallback_location: request.referer, notice: "Отзыв одобрен!")
  end

  private
    def review_params
      params.require(:car_review).permit(:fullname, :text, :star, :active, :phone, :email)
    end

    def set_car
      @car = Car.find(params[:car_id])
    end
end
