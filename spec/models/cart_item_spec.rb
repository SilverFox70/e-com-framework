require 'rails_helper'

RSpec.describe CartItem, type: :model do


  describe "CartItem Table Relationship" do

    describe 'associations' do
      it "has one cart" do
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
        cart_item1 = CartItem.create(cart_id: cart1.id,item_id: item1.id )
        expect(cart_item1.cart).to eq cart1
      end
      it "has one item" do
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
        cart_item1 = CartItem.create(cart_id: cart1.id,item_id: item1.id )
        expect(cart_item1.item).to eq item1
      end
      it "has one user" do
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
        cart_item1 = CartItem.create(cart_id: cart1.id,item_id: item1.id )
        expect(cart_item1.user).to eq user1
      end
    end
  end

end
  DatabaseCleaner.clean
