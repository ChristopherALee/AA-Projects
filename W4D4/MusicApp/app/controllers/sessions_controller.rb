class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    
    if user
      login_user(user)
      redirect_to bands_url
    else
      flash.now[:errors] = ["Incorrect username/password"]
      render :new
    end
  end
  
  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
    end
    
    redirect_to new_session_url
  end
end