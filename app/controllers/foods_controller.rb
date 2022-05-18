class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = Food.all
    @current_user = current_user
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)

    if @food.save
      flash[:success] = 'Food has been added successfully'
      redirect_to foods_path
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
