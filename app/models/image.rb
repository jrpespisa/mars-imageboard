class Image < ActiveRecord::Base
  belongs_to :rover
  has_many :comments
  has_many :votes

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
end
