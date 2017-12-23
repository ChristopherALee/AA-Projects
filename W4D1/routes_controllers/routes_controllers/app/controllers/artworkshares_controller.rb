class ArtworkShares < ApplicationController
  def index
    render json: ArtworkShare.all
  end
  
  def create
    artwork_share = ArtworkShare.new(artwork_share_params)
    if artwork_share.save
      render json: artwork_share
    else
      render json: artwork_share.errors.full_messages, status: 422
    end
  end
  
  def show
    render json: ArtworkShare.find(params[:id])
  end
  
  def update
    artwork_share = ArtworkShare.new(artwork_share_params)
    
    if artwork_share.update(artwork_share_params)
      render json: artwork_share
    else
      render json: artwork_share.errors.full_messages, status: 422
    end
  end
  
  def destroy
    artwork_share = ArtworkShare.find(params[:id])
    artwork_share.destroy
    render json: ['artwork_share has been destroyed']
  end
  
  private
  def artwork_share_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end
end