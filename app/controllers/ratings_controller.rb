class RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
      if @rating.save!
        redirect_back(fallback_location: request.referer, notice: "Сохранено")
      else
        redirect_back(fallback_location: request.referer, alert: "Что то пошло не так!")
      end
  end
  def update
    if Rating.first.update(rating_params)
      flash[:notice] = "Сохранено"
    else
      flash[:notice] = "Что то не так!"
    end
    redirect_back(fallback_location: request.referer)
  end

  private
  def rating_params
    params.require(:rating).permit(:yandex, :google)
  end
end
