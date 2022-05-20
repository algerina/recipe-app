require 'rails_helper'

RSpec.describe 'Shopping List', type: :system do
  describe 'Index' do
    before(:each) do
      User.destroy_all
      Recipe.destroy_all
      Food.destroy_all
      RecipeFood.destroy_all

      User.create(id: 1, name: 'name', email: 'name@name.com', password: 'password')
      User.create(id: 2, name: 'name2', email: 'name2@name.com', password: 'password2')
      Recipe.create(id: 10, user_id: 1, name: 'recipe1', preparation_time: 10, cooking_time: 5, description: 'This is the desc of recipe 1', public: true)
      Recipe.create(id: 11, user_id: 11, name: 'recipe2', preparation_time: 20, cooking_time: 15, description: 'This is the desc of recipe 2', public: true)

      Food.create(id: 1, user_id: 1, name: 'food1', measurement_unit: 'kilos', price: 1)
      Food.create(id: 2, user_id: 2, name: 'food2', measurement_unit: 'grams', price: 2)

      RecipeFood.create(quantity: 5, food_id: 1, recipe_id: 10)
      RecipeFood.create(quantity: 12, food_id: 2, recipe_id: 10)
      RecipeFood.create(quantity: 21, food_id: 1, recipe_id: 11)
      RecipeFood.create(quantity: 11, food_id: 2, recipe_id: 10)

      visit new_user_session_path
      fill_in 'Email', with: 'name@name.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Recipes'
      click_link 'recipe1'
      click_link 'Generate shopping list'
    end

    it 'should have Shopping List text' do
      expect(page).to have_content('Shopping List')
    end

    it 'should be in the shopping list page' do
      expect(page.current_path).to have_content('/shopping_list')
    end

    it 'should show 2 as the ammount of food to buy' do
      expect(page).to have_content('Amount of food items to buy: 2')
    end

    it 'should show $9 as the value of food needed' do
      expect(page).to have_content('Total value of food needed:')
    end

    it 'should show Quantity' do
      expect(page).to have_content('Quantity')
    end

    it 'should show Food' do
      expect(page).to have_content('Food')
    end

    it 'should show price' do
      expect(page).to have_content('Price')
    end
  end
end