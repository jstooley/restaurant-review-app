class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def new
    require_logged_in
    @restaurant = Restaurant.new
  end

  def rating
    @highest_rated_restaurant = Restaurant.highest_rated
  end

  def most_reviewed
    @most_reviewed_restaurant = Restaurant.most_reviewed
  end

  def create
    require_logged_in
    @restaurant = Restaurant.create(restaurant_params)
    if @restaurant.save
      asssign_food_type_to_restaurant(params[:restaurant][:food_type_ids],@restaurant.id)
      redirect_to restaurant_path(@restaurant)
    else
      render "new"
    end
  end

  def destroy
    require_logged_in
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:notice] = "Restaurant deleted."
    redirect_to user_path(current_user.id)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end
end