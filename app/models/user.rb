require './app/uploaders/avatar_uploader'

class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Polymorphism: has_many :post_likes, through: :likes, source: :post
  has_many :likes, dependent: :destroy
  # active_relationship - self is follower
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  # self following many through active_relationships, source associates 'following' with 'followed' foreign_key
  has_many :following, through: :active_relationships, source: :followed
  # passive_relationship - self is being followed
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  # self is followed by many through passive_relationships, source provided for clarity
  has_many :followers, through: :passive_relationships, source: :follower
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

  # Follows another user
  def follow(other_user)
    self.active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user
  def unfollow(other_user)
    self.active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Return true if the current_user is following the other user
  def following?(other_user)
    self.following.include?(other_user)
  end

end
