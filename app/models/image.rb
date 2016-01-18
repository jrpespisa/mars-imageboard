class Image < ActiveRecord::Base
  belongs_to :rover

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
end
