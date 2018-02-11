class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews
  has_many :restaurant_foods
  has_many :food_types, through: :restaurant_foods

  validates :name, presence: true
  validates :name, uniqueness: true
end