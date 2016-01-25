class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items
  has_many :items, through: :cart_items

  def cart_total
    running_total = 0
    self.cart_items.each do |item|
      running_total += item.total_price
    end
    return running_total
  end

end
