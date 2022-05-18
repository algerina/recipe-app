class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end


  def create
  end

  private

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy!
    redirect_to root_path
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
