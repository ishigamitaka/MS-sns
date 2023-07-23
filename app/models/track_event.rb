class TrackEvent < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  # has_many :favorites, dependent: :destroy
  
end
