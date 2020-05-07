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
end
