require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.new( firstname: 'John',
                        lastname: 'Doe',
                        email: 'me@mail.com',
                        password: 'admin')}
  let(:user_no_firstname) {User.new(lastname: 'Doe',
                                    email: 'me@mail.com',
                                    password: 'admin')}
  let(:user_no_lastname) {User.new(firstname: 'John',
                                    email: 'me@mail.com',
                                    password: 'admin')}
  let(:user_no_email) {User.new(firstname: 'John',
                                lastname: 'Doe',
                                password: 'admin')}
  let(:user_no_pwd) {User.new(  firstname: 'John',
                                lastname: 'Doe',
                                email: 'me@mail.com'
                                )}

  describe 'associations' do
    it "has many carts" do
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
      expect(user1.cart).to eq cart1
    end
    it "has cart items" do
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
      expect(user1.cart_items).to include cartItem1
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
      expect(user1.items).to include item1
    end
  end

  describe 'validations' do
    context 'will raise an error' do
      it 'when the firstname field is empty' do
        user_no_firstname.save
        expect(user_no_firstname.errors[:firstname]).to include("can't be blank")
      end
      it 'when the lastname field is empty' do
        user_no_lastname.save
        expect(user_no_lastname.errors[:lastname]).to include("can't be blank")
      end
      it 'when the email field is empty' do
        user_no_email.save
        expect(user_no_email.errors[:email]).to include("can't be blank")
      end
      it 'when the password field is empty' do
        user_no_pwd.save
        expect(user_no_pwd.errors[:password]).to include("can't be blank")
      end
    end
    context "when the user's fields have all appropriate values" do
      it 'will save the user in the database' do
        expect{user.save}.to change{User.count}.by(1)
      end
    end
  end
end

