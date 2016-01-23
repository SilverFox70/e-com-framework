require 'rails_helper'

RSpec.describe Cart, type: :model do

describe "Cart Table Relationship" do

  describe 'associations' do
    it "has many carts" do
      user1 = User.create( firstname: 'John',
                        lastname: 'Doe',
                        email: "me@mail.com#{Time.now}",
                        password: "#{Time.now}")
      cart1 = Cart.create(user_id: user1.id)
      expect(cart1.user).to eq user1
    end
    it "has many cart items" do
      user1 = User.create( firstname: 'John',
                        lastname: 'Doe',
                        email: "me@mail.com#{Time.now}",
                        password: "#{Time.now}")
      cart1 = Cart.create(user_id: user1.id)
      item1= Item.create(name: 'hat',
                       description: 'Test',
                       price: 1.99,
                       quantity: 1,
                       picture_url:"www.some_url.com",
                       upc: '16876')
      cartItem1 = CartItem.create(cart_id: cart1.id,item_id: item1.id )
      expect(cart1.cart_items).to include cartItem1
    end
    it "has many items" do
      user1 = User.create( firstname: 'John',
                        lastname: 'Doe',
                        email: "me@mail.com#{Time.now}",
                        password: "#{Time.now}")
      cart1 = Cart.create(user_id: user1.id)
      item1= Item.create(name: 'hat',
                       description: 'Test',
                       price: 1.99,
                       quantity: 1,
                       picture_url:"www.some_url.com",
                       upc: '16876')
      cartItem1 = CartItem.create(cart_id: cart1.id,item_id: item1.id )
      expect(cart1.items).to include item1
    end
  end

  end

end
  DatabaseCleaner.clean
