class FoodType < ActiveRecord::Base
  has_many :restaurant_foods
  has_many :restaurants, through: :restaurant_foods

  validates :name, presence: true

end