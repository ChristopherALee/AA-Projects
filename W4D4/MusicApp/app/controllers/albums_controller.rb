class AlbumsController < ApplicationController
  def new
    @band = Band.find_by(id: params[:band_id])
    # debugger
  end
  
  def create
    @album = Album.new(album_params)
    @band = Band.find_by(id: params[:band_id])

    if @album.save
      redirect_to band_url(@album.band_id)
    else
      flash.now[:errors] = ["Incorrect parameters"]
      render :new
    end
  end
  
  def show
    band_id = params[:id]
    @band = Band.find(band_id)
    @album = Album.find(@band.albums.)
    render :show
  end
  
  def edit
    # debugger
    @album = Album.find(params[:album][:id])
    render :edit
  end
  
  def update
    @album = Album.find(params[:album][:id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album.id)
    else
      flash.now[:errors] = ["Could not update album."]
    end
  end
  
  def destroy
    @album = Album.find(params[:album][:id])
    @band = Band.find_by(id: params[:id])
    @album.destroy
    redirect_to band_url(@band)
  end
  
  private
  def album_params
    params.require(:album).permit(:band_id, :title, :year, :album_type)
  end
end