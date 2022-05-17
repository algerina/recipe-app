class Food < ApplicationRecord
  validates :name, :measurement_unit, :price, presence: true

  belongs_to :user
end