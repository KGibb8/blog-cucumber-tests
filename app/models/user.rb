require './app/uploaders/avatar_uploader'

class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  # has_many :post_likes, through: :likes, source: :post
  # This works in tandem with fields for 
  accepts_nested_attributes_for :comments
  # Add Avatar Uploader
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  RANKS = ["JESS", "NOOB", "MUNTER", "PLONKER", "STANDARD", "SASS", "PIRATE", "DON", "GOD"]

  def rank
    count = posts.count
    User::RANKS.each_with_index do |rank, i|
      if i * 200 > count || i * 200 >= 1600
        return RANKS[i]
      end
    end
  end

end
