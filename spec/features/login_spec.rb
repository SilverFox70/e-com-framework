require 'rails_helper'

RSpec.describe 'Login', type: :feature, :js => true do

  context 'when a registered user is logged out' do
    it 'is presented with login option' do
      visit('/')
      expect(page).to have_text("Login")
    end
    it 'can click Login to get to form' do
      visit('/')
      click_on("Login")
      expect(page).to have_field("Email Address")
      expect(page).to have_field("Password")
    end
    it 'user can log in with valid credentials' do
      @user = User.create( firstname: 'John',
                        lastname: 'Doe',
                        email: "me@gmail.com",
                        password: "1234")
      p "~" * 40
      visit('/')
      sleep 3
      click_on("Login")
      p User.all
      fill_in('Email Address', :with => "me@gmail.com" )
      fill_in('Password', :with => '1234')
      sleep 3
      click_button("Login")
      expect(page).to have_text("Welcome")
      sleep 5
    end
  end

  context 'when a registered user is logged in' do
    it 'user can log out'
  end

end
DatabaseCleaner.clean
