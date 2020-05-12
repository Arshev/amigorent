class CarReview < ApplicationRecord
  belongs_to :car

  default_scope {order('created_at DESC')}

  # self.per_page = 10

  def blank_stars
    5 - star.to_i
  end

end
