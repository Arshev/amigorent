class Article < ApplicationRecord

  has_one_attached :image
  has_rich_text :text
  has_rich_text :text_en

  default_scope {order('created_at DESC')}

  self.per_page = 10
end
