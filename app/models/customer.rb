class Customer < ApplicationRecord

  has_many:orders
  has_many:addresses,dependent: :destroy
  has_many:cart_items
  has_many:items,through: :cart_items

end
