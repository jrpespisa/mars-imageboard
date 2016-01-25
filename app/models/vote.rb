class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :image

  validates :vote, inclusion: { in: [true, false, 1, 0] }
end
