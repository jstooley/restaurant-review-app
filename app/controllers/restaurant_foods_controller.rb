class RestaurantFoodsController < ApplicationController

  def destroy
    require_logged_in
    @restaurant_foods = RestaurantFood.find_by(restaurant_id: params[:restaurant_id], food_type_id: params[:food_type_id])
    @restaurant_foods.destroy
    redirect_to restaurant_path(params[:restaurant_id])
  end

end