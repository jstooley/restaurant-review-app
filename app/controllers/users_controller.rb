class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    require_logged_in
    @users = User.all
  end

  def create
    @user = User.create(user_params)
    return render :new unless @user.save
    session[:user_id] = @user.id
    redirect_to user_path(current_user.username)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end