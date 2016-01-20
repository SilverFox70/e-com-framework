require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item_no_name) {Item.new(price: 100,
                               description: 'Test',
                               quantity: 1,
                               picture_url:"www.some_url.com",
                               upc: '16876')}
  let(:item_no_price) {Item.new(name: 'hat',
                               description: 'Test',
                               quantity: 1,
                               picture_url:"www.some_url.com",
                               upc: '16876')}
  let(:item_price_not_integer) {Item.new(name: 'hat',
                               price: 0.5,
                               description: 'Test',
                               quantity: 1,
                               picture_url:"www.some_url.com",
                               upc: '16876')}
  let(:item_no_desc) {Item.new(name: 'hat',
                               price: 100,
                               quantity: 1,
                               picture_url:"www.some_url.com",
                               upc: '16876')}
  let(:item_no_qty) {Item.new(name: 'hat',
                               description: 'Test',
                               price: 100,
                               picture_url:"www.some_url.com",
                               upc: '16876')}
  let(:item_non_integer_qty) {Item.new(name: 'hat',
                               description: 'Test',
                               quantity: 0.3,
                               price: 100,
                               picture_url:"www.some_url.com",
                               upc: '16876')}
  let(:item_no_picture_url) {Item.new(name: 'hat',
                               description: 'Test',
                               price: 100,
                               quantity: 1,
                               upc: '16876')}
  let(:item_no_upc) {Item.new(name: 'hat',
                               description: 'Test',
                               price: 100,
                               quantity: 1,
                               picture_url:"www.some_url.com",
                               )}
  let(:item) {Item.new(name: 'hat',
                       description: 'Test',
                       price: 1.99,
                       quantity: 1,
                       picture_url:"www.some_url.com",
                       upc: '16876')}
  describe 'validations' do
    context 'will raise an error' do
      it 'when the name field is empty' do
        item_no_name.save
        expect(item_no_name.errors[:name]).to include("can't be blank")
      end
      it 'when the price field is empty' do
        item_no_price.save
        expect(item_no_price.errors[:price]).to include("can't be blank")
      end
      it 'when the price field is not an integer' do
        item_price_not_integer.save
        expect(item_price_not_integer.errors[:price]).to include("must be an integer")
      end
      it 'when the description field is empty' do
        item_no_desc.save
        expect(item_no_desc.errors[:description]).to include("can't be blank")
      end
      it 'when the quantity field is empty' do
        item_no_qty.save
        expect(item_no_qty.errors[:quantity]).to include("can't be blank")
      end
      it 'when the quantity field is not an integer' do
        item_non_integer_qty.save
        expect(item_non_integer_qty.errors[:quantity]).to include("must be an integer")
      end
      it 'when the picture_url field is empty' do
        item_no_picture_url.save
        expect(item_no_picture_url.errors[:picture_url]).to include("can't be blank")
      end
      it 'when the upc field is empty' do
        item_no_upc.save
        expect(item_no_upc.errors[:upc]).to include("can't be blank")
      end
    end
    context "when the item's fields have all appropriate values" do
      it 'will save the item in the database' do
        expect{item.save}.to change{Item.count}.by(1)
      end
      it 'will save price as pennies' do
        item.save
        expect(item.price).to eq(199)
      end
      it 'will return the price in dollars' do
        item.save
        expect(item.price_as_dollars).to eq('1.99')
      end
    end
  end
end
