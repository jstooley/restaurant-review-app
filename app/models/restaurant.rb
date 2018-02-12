class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews
  has_many :restaurant_foods
  has_many :food_types, through: :restaurant_foods

  validates :name, presence: true
  validates :name, uniqueness: true

  def average_rating
    total = 0
    count = 0

    self.reviews.each do |review|
      total += review.rating
      count += 1
    end

    unless count == 0
      "#{total / count} Star's"
    else
      "No Reviews"
    end

  end
end