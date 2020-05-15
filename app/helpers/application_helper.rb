module ApplicationHelper
  def active_class?(path)
    'active' if request.path == path
  end
  def bg_active(count)
    'bg1' if count.even?
  end
  def rating_yandex
    Rating.first.yandex  if Rating.first.yandex
  end
  def rating_google
    Rating.first.google  if Rating.first.google
  end

  def car_next
    Car.where('id > ? and active = ?', params[:id], true ).first
  end

  def car_previous
    Car.where('id < ? and active = ?', params[:id], true ).last
  end

  def car_rating(car_id)
    car = Car.where(id: car_id).first
    if car.car_reviews.count > 0
      car.car_reviews.average(:star)
    else
      5
    end
  end

  def toastr_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      text = "<script>toastr.#{type}('#{message}', '', { closeButton: true, progressBar: true })</script>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end
  
end
