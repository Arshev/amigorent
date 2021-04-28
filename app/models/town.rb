class Town < ApplicationRecord
  belongs_to :city
  has_one_attached :background
  validates :name, presence: true
  validates :url_name, presence: true
  accepts_nested_attributes_for :city
end
