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
      user = User.create( firstname: 'John',
                        lastname: 'Doe',
                        email: "1@2.3",
                        password: "123")
      visit('/')
      click_on("Login")
      fill_in('Email Address', :with => "1@2.3" )
      fill_in('Password', :with => '123')
      click_button("Login")
      expect(page).to have_text("Welcome")
    end
  end

  context 'when a registered user is logged in' do
    it 'user can log out'
  end

end
DatabaseCleaner.clean
