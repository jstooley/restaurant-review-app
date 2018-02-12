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

    @review = Review.create(review_params)
    @review.restaurant_id = params[:restaurant_id]
    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render "new"
    end
  end

  def edit
    @review = Review.find(params[:user_id])
  end

  def update
    @review = Review.find(params[:user_id])

    @review.update(review_params)
    if @review.save
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating, :user_id, :restaurant_id)
  end
end