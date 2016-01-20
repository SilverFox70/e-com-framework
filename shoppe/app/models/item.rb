class Item < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0}
  validates :description, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0}
  validates :picture_url, presence: true
  validates :upc, presence: true

  before_save :convert_to_pennies
  before_update :convert_to_pennies

  def convert_to_pennies
    self.price = self.price * 100
  end

  def price_as_dollars
    return '%.2f' % (self.price / 100.0)
  end
end
