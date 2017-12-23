class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    
    if @user
      login(@user)
      redirect_to goals_url
    else
      flash.now[:errors] = ["Invalid credentials"]
      render :new
    end
  end
  
  def login(user)
    session[:session_token] = user.reset_session_token!
  end
  
end
