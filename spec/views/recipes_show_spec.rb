require 'rails_helper'

RSpec.describe 'Recipe Show page', type: :system do
  describe 'Show' do
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

      visit new_user_session_path
      fill_in 'Email', with: 'name@name.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Recipes'
      click_link 'recipe1'
    end


    it 'should show the name of the recipe' do
      expect(page).to have_content('recipe1')
    end

    it "should have Praparation_time" do
      expect(page).to have_content('Praparation_time')
    end

    it "should have Cooking_time" do
      expect(page).to have_content('Cooking_time')
    end

    it "should have Description" do
      expect(page).to have_content('Description')
    end
    

    it 'should show the description of the recipe' do
      expect(page).to have_content('This is the desc of recipe 1')
    end


    it 'should redirect to shopping list page when press a button' do
      click_link 'Generate shopping list'
      expect(page.current_path).to have_content('/shopping_list')
    end


    it 'should show the name of the food in the recipe' do
      expect(page).to have_content('food1')
    end
  end
end