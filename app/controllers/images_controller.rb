class ImagesController < ApplicationController
  def show
    @image = Image.find(params[:id])
    @comment = Comment.new
    @comments = @image.comments
  end
end
