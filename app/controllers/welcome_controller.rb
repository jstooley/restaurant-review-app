class WelcomeController < ApplicationController

  def home
    if logged_in?
      redirect_to user_path(current_user.username)
    else
      @users = User.all
    end
  end

end