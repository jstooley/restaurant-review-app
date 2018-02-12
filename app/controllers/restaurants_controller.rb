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

  def create
    require_logged_in
    @restaurant = Restaurant.create(restaurant_params)

    if @restaurant.save
      params[:restaurant][:food_type_ids].reject(&:empty?).each do |ft_id|
        @rf = RestaurantFood.new
        @rf.restaurant_food_type_set(ft_id, @restaurant.id)
      end
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