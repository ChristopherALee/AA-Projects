class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user.save
      login(@user)
    else
      flash[:errors] = ['Invalid Login']
    end
  end

  def destroy
    # @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if current_user
      logout(current_user)
      render json: {}
    else
      render :status => 404
    end
  end
end
