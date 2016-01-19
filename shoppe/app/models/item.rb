class Item < ActiveRecord::Base
  def price_as_dollars
    return '%.2f' % (self.price / 100.0)
  end
end
