class UsersController < ApplicationController
  
  before_action :redirect_to_cat_page_if_logged_in
  
  def new   
  end 
  
  def create 
    user = User.new(user_params)
    
    if user.save 
      login(user)
      redirect_to cats_url
    else 
      flash.now[:errors] = user.errors.full_messages 
      render :new
    end 
  end 
  
  private 
  def user_params 
    params.require(:user).permit(:username, :password)
  end 
  
end 