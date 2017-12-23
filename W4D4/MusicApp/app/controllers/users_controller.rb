class UsersController < ApplicationController
  
  def login(user)
    session[:session_token] = user.reset_session_token!
  end
  
  def new
  end
  
  def create
    user = User.new(user_params)
    
    if user.save
      login_user(user)
      redirect_to bands_url
    else
      flash.now[:errors] = ["Invalid username/password parameters"]
      render :new
    end
  end
  
  def show
    user = User.find_by(email: params[:email])
    
    if user
      render :show
    else
      flash.now[:errors] = ["User doesn't exist"]
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end