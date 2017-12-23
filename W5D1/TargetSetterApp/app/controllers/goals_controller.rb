class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    
    if @goal.save
      redirect_to goals_url
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def destroy
    @goal = Goal.find_by(id: params[:id])
    @goal.destroy
    redirect_to goals_url
  end

  def show
    @goal = Goal.find_by(id: params[:id])
    render :show
  end

  def edit
    @goal = Goal.find_by(id: params[:id])
    
  end

  def update
    @goal = Goal.find_by(id: params[:id])
    if @goal.update_attributes(goal_params)
      redirect_to goal_url(@goal) 
    else 
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end 
  end
  
  def goal_params 
    params.require(:goal).permit(:title, :user_id)
  end 
end
