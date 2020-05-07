class Car < ApplicationRecord
  belongs_to :user
  # has_one_attached :main_image
  # has_many_attached :images

  mount_uploader :main_image, MainImageUploader
  mount_uploaders :images, ImagesUploader

  has_rich_text :description

  default_scope {order('sort')}

end
