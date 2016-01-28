require "rails_helper"

RSpec.describe Api::V1::CommentsController, type: :controller do
  describe "POST /api/v1/comments" do
    it "creates a new comment" do
      comment = build(:comment)
      post :create, comment: comment.attributes
      expect(response).to have_http_status(:created)
      expect(response.header["Location"]).to match /\/api\/v1\/comments/
    end

    it "returns 'not_found' if validations fail" do
      post :create, comment: { body: "", image_id: 0, user_id: 0 }
      expect(response).to have_http_status(:not_found)
    end
  end
end
