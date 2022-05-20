require 'rails_helper'

RSpec.describe 'Add food page', type: :feature do
  before do
    User.create(id: 1, name: 'name', email: 'name@name.com', password: 'password')
  end

  describe 'Visiting the add food page' do
    before :each do
      visit '/users/sign_in'
      fill_in 'Email', with: 'name@name.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Add Food'
    end

    it 'should have Add New Food' do
      expect(page).to have_text('Add New Food')
    end

    it 'should have Back to Foods List' do
      expect(page).to have_text('Back to Foods List')
    end

    it 'should have Create Food' do
      expect(page).to have_button('Create Food')
    end
  end
end