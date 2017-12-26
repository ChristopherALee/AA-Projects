class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
    else
      flash[:errors] = @user.errors.full_messages
    end
    render :show
  end

  def show
    @user = User.find_by(id: params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
