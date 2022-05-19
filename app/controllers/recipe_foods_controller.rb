class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @recipe_food = RecipeFood.new
    @foods = Food.where(user_id: current_user)
    @recipe = Recipe.find(params[:recipe_id])

    redirect_to recipe_path(@recipe) unless @recipe.user == current_user
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.food_id = params[:food_id]
    @recipe_food.recipe_id = params[:recipe_id]

    if @recipe_food.save
      redirect_to recipe_path(id: params[:recipe_id])
      flash[:success] = 'Ingredient added successfuly'
    else 
      redirect_to new_recipe_recipe_food_path
      flash[:alert] = 'Try again'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(Recipe.find(params[:recipe_id]))
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity)
  end

end
