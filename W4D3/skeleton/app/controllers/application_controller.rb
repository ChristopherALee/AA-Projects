class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :correct_owner
  
  def login(user)
    session[:session_token] = user.reset_session_token!
  end 
  
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end
  
  def redirect_to_cat_page_if_logged_in
    redirect_to cats_url if current_user
    # debugger
  end
  
  def correct_owner(cat)
    owner = cat.user_id 
    if owner == current_user.id 
      return 
    else 
      flash.now[:error] = "This isn't your cat =^.^="
      render :show
    end   
  end 
end
