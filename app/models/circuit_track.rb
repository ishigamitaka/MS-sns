class CircuitTrack < ApplicationRecord
  has_one_attached :circuit_image
  
  has_many :users
  has_many :my_best_times
end
