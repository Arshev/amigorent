class Article < ApplicationRecord

  has_one_attached :image
  has_rich_text :text

  default_scope {order('created_at DESC')}

  self.per_page = 10
end
