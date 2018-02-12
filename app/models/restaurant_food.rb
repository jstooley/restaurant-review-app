class RestaurantFood < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :food_type

  def restaurant_food_type_set(food_type_id, restaurant_id)
    self.food_type_id = food_type_id
    self.restaurant_id = restaurant_id
    self.save
  end
end