class City < ApplicationRecord
    has_many :towns
    has_one_attached :background
    validates :name, presence: true
    validates :url_name, presence: true
end
