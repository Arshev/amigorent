module ApplicationHelper
  def active_class?(path)
    "active" if request.path == path
  end

  def bg_active(count)
    "bg1" if count.even?
  end

  def rating_yandex
    Rating.first.yandex if Rating.first.yandex
  end

  def rating_google
    Rating.first.google if Rating.first.google
  end

  def car_next
    car = Car.find(params[:id])
    if car.sort && car.sort >= 0 && car.sort < Car.maximum(:sort)
      Car.where("sort > ? and active = ? and city = ?", car.sort, true, car.city).first
    elsif car.sort == Car.maximum(:sort)
      Car.where(sort: Car.minimum(:sort)).first
    else
      Car.where("id > ? and active = ? and city = ?", car.id, true, car.city).first
    end
  end

  def car_previous
    car = Car.find(params[:id])
    if car.sort && car.sort >= 0 && car.sort > Car.minimum(:sort)
      Car.where("sort < ? and active = ? and city = ?", car.sort, true, car.city).last
    elsif car.sort == Car.minimum(:sort)
      Car.where(sort: Car.maximum(:sort)).first
    else
      Car.where("id < ? and active = ? and city = ?", car.id, true, car.city).last
    end
  end

  def car_rating(car_id)
    car = Car.where(id: car_id).first
    if car.car_reviews.count > 0
      car.car_reviews.average(:star)
    else
      5
    end
  end

  def transliterate cyrillic_string
    ru = { 'а' => 'a', 'б' => 'b', 'в' => 'v', 'г' => 'g', 'д' => 'd', \
    'е' => 'e', 'ё' => 'e', 'ж' => 'j', 'з' => 'z', 'и' => 'i', \
    'к' => 'k', 'л' => 'l', 'м' => 'm', 'н' => 'n', 'о' => 'o', \
    'п' => 'p', 'р' => 'r', 'с' => 's', 'т' => 't', 'у' => 'u', \
    'ф' => 'f', 'х' => 'h', 'ц' => 'c', 'ч' => 'ch', 'ш' => 'sh', \
    'щ' => 'shch', 'ы' => 'y', 'э' => 'e', 'ю' => 'u', 'я' => 'ya', \
    'й' => 'i', 'ъ' => '', 'ь' => ''}

    identifier = ''

    cyrillic_string.downcase.each_char do |char|
      identifier += ru[char] ? ru[char] : char
    end

    identifier.gsub!(/[^a-z0-9_]+/, '_'); # remaining non-alphanumeric => hyphen
    identifier.gsub(/^[-_]*|[-_]*$/, ''); # remove hyphens/underscores and numbers at beginning and hyphens/underscores at end
  end

  def toastr_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = "success" if type == "notice"
      type = "error" if type == "alert"
      text = "<script>toastr.#{type}('#{message}', '', { closeButton: true, progressBar: true })</script>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end

  def cities_list
    City.where(active: true)
  end
end
