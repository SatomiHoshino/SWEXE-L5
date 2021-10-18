class User < ApplicationRecord
  #TODO: validates
  validates :uid, uniqueness: true, presence: true
  validates :pass, presence: true
  has_many :tweets
  has_many :likes
  has_many :like_tweets, through: :likes, source: :tweet
end
