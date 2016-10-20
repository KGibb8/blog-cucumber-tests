class CommentsController < ApplicationController
  before_action :authorisation, only: [:update, :destroy]

  def create
    my_comment_params = comment_params.to_h.merge(post_id: params[:post_id])
    comment = current_user.comments.create(my_comment_params)
    comment.user.avatar = comment.user.avatar.icon.url
    render({json: {comment: comment, user: current_user}})
    # render({json: comment, json: current_user})
    # render({json: comment, include: {user: {only: [:email, :avatar]}}})
  end
  
  def update
    @comment.update(comment_params)
    # @comment.user.avatar = @comment.user.avatar.icon.url
    render({json: @comment, include: {user: {only: :email}}})
  end

  def destroy
    @comment.destroy
    render({json: {success: true}})
  end

  private

  def authorisation
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment
    else
      flash[:notice] = "ERROREZ. Dis ain't belongin tu yousa"
      nil
    end
  end

  def comment_params
    params.require(:comment).permit(:id, :body)
  end
end
