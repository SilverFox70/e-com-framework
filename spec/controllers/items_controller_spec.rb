require 'rails_helper'

# index, create, new, edit, show, update, destroy

RSpec.describe ItemsController, type: :controller, :js => true do
  describe 'index action' do
    it 'should load the page' do
      visit(items_path)
      expect(response.status).to eq 200
      expect(response).to have_rendered(:index)
    end
    it 'should load all items' do
      all_items = []
      3.times.map do |n|
        item = Item.create!(name: 'hat',price: 100, description: 'a hat', quantity: 1, picture_url: 'www.some_url.com', upc: '1234')
        all_items << item
      end
      get :index
      expect(assigns[:items]).to eq all_items
    end
  end

  describe 'create action' do
      let( :item_params ) {{name: 'hat', price: 100, description: 'a hat', quantity: 1, picture_url: 'www.some_url.com', upc: '1234'}}
    context 'when given valid params' do
      xit 'should create the item and redirect to items index page' do
        visit(new_item_path)
        # expect{Item.create(item_params)}.to change{Item.count}.by(1)
        # expect(response).to redirect_to("/items/#{Item.last.id}")
      end
    end
    context 'when given invalid params' do
      xit 'should not create the item and rerender the new item page' do
        # expect{
        #   post :create, item: item_params
        # }.to_not change{Item.count}
        # expect(response).to have_rendered(:new)
      end
    end
  end

  describe 'new action' do
    it 'should load the page' do
      visit("/items/#{item.id}/new")
      expect(response.status).to eq 200
      expect(response).to have_rendered(:new)
    end
  end

  describe 'edit action' do
    it 'should load the page' do
      item = Item.create!(name: 'hat',price: 100, description: 'a hat', quantity: 1, picture_url: 'www.some_url.com', upc: '1234')
      visit("/items/#{item.id}/edit")
      expect(response.status).to eq 200
      expect(response).to have_rendered(:edit)
    end
  end

  describe 'show action' do
    it 'should load the page' do
      item = Item.create!(name: 'hat',price: 100, description: 'a hat', quantity: 1, picture_url: 'www.some_url.com', upc: '1234')
      visit("/items/#{item.id}")
      expect(response.status).to eq 200
      expect(response).to have_rendered(:show)
    end
  end

  describe 'update action' do
    xit 'has tests'
  end

  describe 'destroy action' do
    xit 'has tests'
  end

  # describe 'item show' do
  #   let(:item) {Item.new(name: 'hat',
  #                       price: 100,
  #                       description: 'a hat',
  #                       quantity: 1,
  #                       picture_url: 'www.some_url.com',
  #                       upc: '1234')}
  #   it 'should show a particular item' do
  #     get :show
  #     expect(assigns[:item]). to eq(item)
  #     expect(response.status).to eq(200)
  #     expect(response).to have_rendered(:show)
  #   end
  # end
end
  DatabaseCleaner.clean
