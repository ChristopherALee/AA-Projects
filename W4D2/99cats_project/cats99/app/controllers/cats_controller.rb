class CatsController < ApplicationController
  def index
    # debugger
    @cats = Cat.all
    render :index
  end
  
  def show
    @cat = Cat.find_by(id: params[:id])
    
    if @cat
      render :show
    else
      redirect_to cats_url
    end
  end
  
  def create
    @cat = Cat.new(cat_params)
    
    if @cat.save
      render :index
    else
      render json: @cat.errors.full_messages
    end
  end
  
  def edit
    @cat = Cat.find_by(id: params[:id])
    
    if @cat
      render :edit
    else
      render json: @cat.errors.full_messages
    end
  end
  
  def new
    @cat = Cat.new
    
    render :new
  end
  
  private
  
  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end
end
