class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
  end

  def destroy
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
