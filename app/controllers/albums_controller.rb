class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    @album = Album.where(id: params[:id]).includes(:photos).first
    @preset = Cloudinary::Api.upload_preset('wbasj7k0')
  end

  def new
    @album = Album.new(:title => "My album \##{1 + (Album.maximum(:id) || 0)}")
  end

  def create
    @album = Album.new(album_params)

    unless @album.save
      @error = @album.errors.full_messages.join('. ')
      render "new"
      return
    end

    redirect_to @album
  end


  private

  def album_params
    params.require(:album).permit(:title)
  end
end
