class Order < ApplicationRecord

  belongs_to:customer
  has_many:order_details
  has_many:items,through: :order_details

  enum rate: [:クレジットカード, :銀行振込]

end
