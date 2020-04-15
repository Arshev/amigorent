class Review < ApplicationRecord
  default_scope {order('created_at DESC')}

  def blank_stars
    5 - star.to_i
   end
end
