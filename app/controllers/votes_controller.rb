class VotesController < ApplicationController
  def create
    new_vote = params[:newVote]
    i_id = params[:iId].to_i

    vote = Vote.find_by(user: current_user, image_id: i_id)

    if vote
      if vote.vote == (new_vote == 'upvote')
        vote.destroy
      else
        vote.vote = !vote.vote
        vote.save
      end
    else
      Vote.create(
        user: current_user,
        image_id: i_id,
        vote: new_vote == 'upvote'
      )
    end

    render json: {
      upvotes: Vote.where(image_id: i_id, vote: true).count,
      downvotes: Vote.where(image_id: i_id, vote: false).count
    }
  end
end
