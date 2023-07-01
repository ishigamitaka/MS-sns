class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: "follower_id", class_name: "User"
  belongs_to :followed, foreign_key: "followed_id", class_name: "User"

  has_many :followers, through: :followed, source: :follower
  has_many :followings, through: :follower, source: :followed
  #belongs_to :user
end
