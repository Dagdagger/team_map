class PhotosController < ApplicationController
  def index
  		@profile = Profile.find(params[:id])
  		@photos = @profile.photos.all
  end

  def new
    @profile = Profile.find(params[:id])
    @photo = @profile.photos.new
  end

  def edit
    @profile = Profile.find(params[:id])
    @photos = @profile.photos.all
  end

  def update
  end




  def create
    @profile = Profile.find(params[:id])
    @photo = @profile.photos.new(photo_params)
    respond_to do |format|
      if @photo.save
        format.html { redirect_to root_url, notice: 'photo was successfully added.'}
      else
        format.html do
          @photos = @profile.photos.all
          flash.now[:error] = 'Failed to add photo'
          redirect_to root_url
        end
      end
    end
  end


  def destroy
  @photo.destroy
  respond_to do |format|
    format.html { redirect_to root_url, notice: 'photo was successfully destroyed.' }
    end
  end



  private

  def photo_params
  	params.require(:photo).permit(:name, :description, :image)
  end





end
