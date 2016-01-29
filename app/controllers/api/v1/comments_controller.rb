class Api::V1::CommentsController < ActionController::Base
  protect_from_forgery with: :null_session

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: {
        id: comment.id,
        comment: comment,
        user: current_user
      }
    else
      render json: :nothing, status: :not_found
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :image_id)
  end
end
