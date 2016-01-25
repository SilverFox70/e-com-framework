class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item
  has_one :user, through: :cart

  def total_price
    return self.item.price * self.quantity
  end
end
