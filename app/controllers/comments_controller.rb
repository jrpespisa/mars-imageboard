class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @image = Image.find(params[:image_id])
    @comment = Comment.new
  end

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to image_path(@image)
    else
      flash[:errors] = @comment.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    unless @comment.user == current_user
      raise_error
    end
    @image = @comment.image
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to image_path(@comment.image)
    else
      flash[:notice] = "You must fill out all of the required fields"
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:image_id])
    Comment.find(params[:id]).destroy

    redirect_to image_path(@image)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :image_id, :user_id)
  end
end
