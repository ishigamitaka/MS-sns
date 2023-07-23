class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  # belongs_to :track_event
  # belongs_to :part
end
