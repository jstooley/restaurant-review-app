class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews
  has_many :restaurant_foods
  has_many :food_types, through: :restaurant_foods

  validates :name, presence: true
  validates :name, uniqueness: true

  def average_rating
    total = 0.0
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

  def self.highest_rated
    highest_rating = 0
    best_restaurant = nil
    self.all.each do |r|
      if r.average_rating.to_i > highest_rating
        highest_rating = r.average_rating.to_i
        best_restaurant = r
      end
    end
    best_restaurant
  end

  def self.most_reviewed
    highest_count = 0
    count = 0
    highest_restaurant = ""
    self.all.each do |r|
      r.reviews.each do |review|
        count += 1
      end
      if count >= highest_count
        highest_restaurant = r.name
        highest_count = count
        count = 0
      else
        count = 0
      end
    end
    highest_restaurant
  end
end