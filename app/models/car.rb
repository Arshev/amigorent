class Car < ApplicationRecord
  belongs_to :user

  default_scope {order('sort')}
end
