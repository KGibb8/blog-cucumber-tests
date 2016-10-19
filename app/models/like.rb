class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validate :duplicate, on: :create
  validate :no_update, on: :update

  private

  def duplicate
    like = Like.find_by(user_id: self.user_id, post_id: self.post_id)
    unless like.nil?
      self.errors.add(:duplicate, "This user has already liked this post")
    end
  end

  def no_update
    self.errors.add(:no_update, "You cannot update a like")
  end
end
