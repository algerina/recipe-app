class RecipeFoodsController < ApplicationController
  def def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    if recipe_food.save
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
