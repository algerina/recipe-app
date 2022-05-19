class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @current_user = current_user
  end

  def show
    @recipe = Recipe.find(params[:id])
    @current_user = current_user
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      flash[:success] = 'Recipe has been added successfully'
      redirect_to recipes_path
    else
      flash[:alert] = 'Recipe was not added'
      redirect_to new_recipe_path
    end
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.toggle(:public)
    recipe.save
    redirect_to recipe_path(recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
