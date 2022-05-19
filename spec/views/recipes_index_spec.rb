require 'rails_helper'

RSpec.describe 'Recipe index page', type: :system do
  before do
    user1 = User.create(id: 1, name: 'name', email: 'name@name.com', password: 'password')
    user1.save
    recipe1 = user1.recipes.new(name: 'recipe1', preparation_time: 150, cooking_time: 30, description: 'description1')
    recipe1.save
  end

  describe 'Visiting the recipes index page' do
    before :each do
      visit '/recipes'
      fill_in 'Email', with: 'name@name.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Recipes'
    end

    it 'should display the recipes List' do
      expect(page).to have_text('Recipes List')
    end

    it 'should display the recipe name' do
      expect(page).to have_text('recipe1')
    end

    it 'should display the description' do
      expect(page).to have_text('description1')
    end

    it 'should have an Add Recipe button' do
      expect(page).to have_text('Add Recipe')
    end
  end
end