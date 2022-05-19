class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe
  validates :food_id, uniqueness: { scope: :recipe_id }
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def value
    "$#{quantity * food.price}"
  end

  def name
    food.name
  end

  def quantity_measure
    "#{quantity} #{food.measurement_unit}"
  end
end
