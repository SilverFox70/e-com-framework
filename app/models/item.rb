class Item < ActiveRecord::Base
  has_many :cart_items
  has_many :carts, through: :cart_items
  has_many :users, through: :carts

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0}
  validates :description, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0}
  validates :picture_url, presence: true
  validates :upc, presence: true

  def formatted_price
    return '%.2f' % self.price
  end
end
