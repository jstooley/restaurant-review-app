class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  before_action :require_logged_in, only: [:destroy, :update, :edit]
  helper_method :current_user, :logged_in?

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def require_logged_in
    redirect_to(login_path) unless logged_in?
  end

  def asssign_food_type_to_restaurant(food_type_ids, restaurant_id)
    food_type_ids.reject(&:empty?).each do |ft_id|
      @rf = RestaurantFood.new
      @rf.restaurant_food_type_set(ft_id, restaurant_id)
    end
  end

end
