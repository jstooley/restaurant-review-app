class FoodTypesController < ApplicationController

  def new
    require_logged_in
    @food_type = FoodType.new
  end

  def create
    require_logged_in
    @food_type = FoodType.create(food_type_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant_foods = RestaurantFood.new(food_type_id: @food_type.id, restaurant_id: @restaurant.id )
    if @restaurant_foods.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render 'new'
    end

  end

  private

  def food_type_params
    params.require(:food_type).permit(:name)
  end
end