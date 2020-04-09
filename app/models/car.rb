class Car < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  default_scope {order('sort')}
end
