class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many:addresses
         has_many:orders
         has_many:cart_items
         has_many:items,through: :cart_items

  def full_name
    self.first_name + self.last_name
  end
end
