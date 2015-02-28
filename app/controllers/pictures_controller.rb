class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
    @picture = Picture.new
  end

  def create
    picture = Picture.new(picture_params)
    if picture.save
      flash[:success] = "Picture uploaded"
      redirect_to pictures_path
    else
      flash[:error] = "Upload failed"
      render pictures_path
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:name, :image_file)
  end
end