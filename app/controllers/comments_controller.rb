class CommentsController < ApplicationController
  before_action :find_comment, only: [:update]

  def create
    my_comment_params = comment_params.to_h.merge(post_id: params[:post_id])
    comment = current_user.comments.create(my_comment_params)
    render({json: comment, include: {user: {only: :email}}})
  end
  
  def update
    @comment.update(comment_params)
    # @comment.user.avatar = @comment.user.avatar.icon.url
    render({json: @comment, include: {user: {only: :email}}})
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:id, :body)
  end
end
