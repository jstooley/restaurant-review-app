class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if @user = User.find_or_create_by(uid: auth['uid'])
      @user do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
      end
      session[:user_id] = @user.id
      redirect_to user_path(current_user.username)
    else
      @user = User.find_by(:username => session_params[:username])
      if @user && @user.authenticate(session_params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(current_user.username)
      else
        render login_path
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end

end