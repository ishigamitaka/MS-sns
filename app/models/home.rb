class Home < ApplicationRecord
  has_one_attached :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
