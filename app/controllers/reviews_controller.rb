class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find_by(id: params[:id])
  end

  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to login_path, alert: "User not found."
    else
      @review = Review.new(user_id: params[:user_id])
    end
  end

  def create
    binding.pry
  end

  def edit
    @review = Review.find_by(id: params[:id])
  end

  def update

  end

  def destroy

  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end
end