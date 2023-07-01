class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :mycar_image
  
  has_many :posts, dependent: :destroy
  has_many :track_events, dependent: :destroy
  has_many :parts
  has_many :my_best_times
  belongs_to :circuit_tracks, optional: true
  has_many :favorites, dependent: :destroy
  
  accepts_nested_attributes_for :my_best_times, allow_destroy: true
  
  has_many :follows, foreign_key: :follower_id, dependent: :destroy
  has_many :followings, through: :follows, source: :followed
  has_many :followers, through: :follows, source: :follower

  def follow(user)
    followings << user
  end

  def unfollow(user)
    followings.delete(user)
  end

  def following?(user)
    followings.include?(user)
  end
  
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :nickname, presence: true
  
  enum main_circuit: { tukubacircuit: 0, fuji_speedway: 1, suzukacircuit: 2, twinringmotegi: 3 }
end
