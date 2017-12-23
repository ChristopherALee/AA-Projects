class TracksController < ApplicationController
  def new
    @album = Album.find_by(id: params[:album_id])
    @band = Band.find_by(id: @album[:band_id])
  end
  
  def show
    
  end
  
  def create
    @track = Track.new(track_params)
    @album = Album.find_by(id: @track[:album_id])
    
    if @track.save
      redirect_to album_url(@track.album_id)
    else
      flash.now[:errors] = ["Couldn't create track"]
    end
  end
  
  private
  def track_params
    params.require(:track).permit(:album_id, :title, :ord, :track_type)
  end
end