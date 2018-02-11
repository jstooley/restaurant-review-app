class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create

  end

  def destroy

  end

  private

  def review_params
    params.require(:restaurant).permit(:name)
  end
end