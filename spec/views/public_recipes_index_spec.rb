require 'rails_helper'

RSpec.describe 'Public Recipes page', type: :system do
  before do
    User.create(id: 1, name: 'name', email: 'name@name.com', password: 'password')
    Food.create(id: 1, user_id: 1, name: 'orange', measurement_unit: 'gr', price: 2)
    Recipe.create(id: 10, user_id: 1, name: 'recipe1', preparation_time: 10, cooking_time: 5,
                  description: 'This is the desc of recipe 1', public: true)
  end

  describe 'Visiting the food index page' do
    before :each do
      visit '/users/sign_in'
      fill_in 'Email', with: 'name@name.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Public Recipes'
    end
    it 'should go to public recipes page' do
      expect(page.current_path).to have_content('/public_recipes')
    end

    it 'should display Public Recipes text' do
      expect(page).to have_link('Public Recipes')
    end

    it 'should display the Total food items text' do
      expect(page).to have_text('Total Food Item')
    end
  end
end
