class Order < ApplicationRecord

  belongs_to:customer
  has_many:order_details
  has_many:items,through: :order_details

end
