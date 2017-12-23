class SessionsController < ApplicationController
  
  before_action :redirect_to_cat_page_if_logged_in, except: :destroy

  def new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    
    if user
      login(user)
      redirect_to cats_url
    else
      flash.now[:errors] = "wrong username/password"
      render :new
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
      redirect_to new_session_url
    end
  end
  
  
end
