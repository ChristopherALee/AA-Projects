class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to goals_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  def login(user)
    session[:session_token] = user.reset_session_token!
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
