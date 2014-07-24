class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
    @picture = Picture.new
  end
end