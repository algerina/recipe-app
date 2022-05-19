class ShoppingListController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = RecipeFood.all
    @food = Food.all
    @total_price = sum(@recipe.recipe_foods.includes([:food]))
  end

  private

  def sum(array)
    sum = 0
    array.each do |number|
      sum += number.quantity * number.food.price
    end
    sum
  end
end
