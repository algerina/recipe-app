require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  describe 'New' do
    before(:each) do
      User.destroy_all
      Recipe.destroy_all

      User.create(id: 1, name: 'name', email: 'name@name.com', password: 'password')
      User.create(id: 2, name: 'name2', email: 'name2@name.com', password: 'password2')

      Recipe.create(id: 10, user_id: 1, name: 'recipe1', preparation_time: 10, cooking_time: 5,
                    description: 'This is the desc of recipe 1', public: true)

      visit new_user_session_path
      fill_in 'Email', with: 'name@name.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Recipes'
      click_link 'Add Recipe'
    end

    it 'should have Add New Recipe content' do
      expect(page).to have_content('Add New Recipe')
    end

    it 'should have a public checkbox' do
      expect(page).to have_content('Public')
    end

    it 'should have back to recipes button' do
      expect(page).to have_link('Back to Recipes List')
    end

    it 'should have a Create Recipe button' do
      expect(page).to have_button('Create Recipe')
    end
  end
end
