class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :likes
  accepts_nested_attributes_for :comments
  # accepts_nested_attributes_for :tags
  # accepts_nested_attributes_for :taggings

  # has_many :user_likes, through: :likes, source: :user
end
