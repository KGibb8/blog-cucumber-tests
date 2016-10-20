class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :likes

  # has_many :user_likes, through: :likes, source: :user
end
