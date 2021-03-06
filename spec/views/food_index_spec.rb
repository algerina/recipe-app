require 'rails_helper'

RSpec.describe 'Food index page', type: :system do
  before do
    User.create(id: 1, name: 'name', email: 'name@name.com', password: 'password')
    Food.create(id: 1, user_id: 1, name: 'orange', measurement_unit: 'gr', price: 2)
  end

  describe 'Visiting the foods index page' do
    before :each do
      visit '/foods'
      fill_in 'Email', with: 'name@name.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'should display the Food List' do
      expect(page).to have_text('Foods List')
    end

    it 'should display the measurement_unit of the food' do
      expect(page).to have_text('gr')
    end

    it 'should display the price of the food' do
      expect(page).to have_text('2')
    end

    it 'should have an Add Food button' do
      expect(page).to have_text('Add Food')
    end
  end
end
