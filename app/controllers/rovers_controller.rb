class RoversController < ApplicationController
  def index
    @rovers = Rover.all
  end

  def show
    @rover = Rover.find(params[:id])
    @images = @rover.images
  end
end
