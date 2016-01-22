class ImagesController < ApplicationController
  def show
    @image = Image.find(params[:id])
    @comments = @image.comments
  end
end
