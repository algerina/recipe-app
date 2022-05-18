class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, :description, :cooking_time, presence: true

  def total_food_items
    recipe_foods.length
  end

  def total_price
    price = 0
    recipe_foods.each do |recipe|
      price += recipe.quantity * recipe.food.price
    end
    price
  end
end
