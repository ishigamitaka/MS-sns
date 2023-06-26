class Part < ApplicationRecord
  has_one_attached :parts_image
  belongs_to :user
  has_many :favorites, dependent: :destroy
  
end
