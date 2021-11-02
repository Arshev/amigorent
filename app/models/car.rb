class Car < ApplicationRecord
  belongs_to :user
  has_many :car_reviews

  # has_one_attached :main_image
  # has_many_attached :images

  mount_uploader :main_image, MainImageUploader
  mount_uploaders :images, ImagesUploader

  has_rich_text :description
  has_rich_text :description_en

  default_scope { order("sort") }

  # def ids_rentprog=(value)
  #   self.ids_rentprog = value.split(",")
  # end

  # def ids_rentprog
  #   self.ids_rentprog.to_s
  # end
end
