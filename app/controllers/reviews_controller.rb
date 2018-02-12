class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find_by(id: params[:id])
  end

  def new
    require_logged_in
      @review = Review.new(user_id: params[:user_id])
  end

  def create
    require_logged_in
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
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review deleted."
    redirect_to user_path(current_user.id)
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating, :user_id, :restaurant_id)
  end
end