class FoodsController < ApplicationController
  def index
    @foods = Food.all
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
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
