require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # describe 'index action' do

  #   before do
  #     @all_users = 3.times.map do |n|
  #       User.create!(firstname: 'John',
  #                    lastname: 'Doe',
  #                    email: "me#{n}@mail.com",
  #                    password: '1234')
  #     end
  #   end

  #   it 'should load all items' do
  #     get :index
  #     expect(assigns[:users]).to eq @all_users
  #     expect(response.status).to eq 200
  #     expect(response).to have_rendered(:index)
  #   end
  # end

  describe 'user create' do
    context 'when given valid params' do
      let :user_params do
        {firstname: 'John',
         lastname: 'Doe',
         email: 'me@mail.com'}
      end
      it 'should create the user and redirect to root page' do
        expect{
          post :create, {user: user_params, password_plaintext: '1234'}
        }.to change{User.count}.by(1)
      end
    end
    context 'when given invalid params' do
      let :user_params do
        {firstname: 'John',
         lastname: 'Doe',
         email: 'me@mail.com'}
      end
      it 'should not create the user and rerender the new user page' do
        expect{
          post :create, user: user_params
        }.to_not change{User.count}
      end
    end
  end
end
  DatabaseCleaner.clean
