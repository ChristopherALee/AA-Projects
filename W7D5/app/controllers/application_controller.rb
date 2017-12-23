class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

  def login(user)
    session[:session_token] = user.reset_session_token
  end

  def current_user
    @current_user = User.find_by(session_token: session[:session_token])
    return @current_user if @current_user
    nil
  end

  def logout(user)
    user.reset_session_token
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end

end
