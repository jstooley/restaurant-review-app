class AuthinticationsController < ApplicationController

  def create
    if auth_hash = request.env["omniauth.auth"]
      @user = User.find_or_create_by(uid: request.env["omniauth.auth"]["uid"])
      @user.email = request.env["omniauth.auth"]["info"]["email"]
      @user.username = request.env["omniauth.auth"]["info"]["nickname"]
      @user.save(validate: false)
      session[:user_id] = @user.id
      redirect_to user_path(current_user.username)
    end
  end

end