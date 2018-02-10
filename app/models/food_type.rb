class FoodType < ActiveRecord::Base
  has_many :restaurant_foods
  has_many :restaurant, through: :restaurant_foods
end