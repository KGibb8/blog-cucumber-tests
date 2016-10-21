class LikesController < ApplicationController

  def create
    # params.merge(user_id: current_user.id)
    like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    # like = Like.find_by(user_id: current_user.id, post_id: params[:format])
    unless like
      # current_user.likes.create(post_id: params[:format])
      like = current_user.likes.create(post_id: params[:post_id])
    else
      like.destroy
    end
    ActionCable.server.broadcast("post_channel", message: {post_id: like.post_id, count: like.post.likes.count})
    render({json: {success: true}})
  end

  def destroy
    # current_user.likes.destroy(post_id: params[:like][:post_id])
    current_user.likes.destroy(like_params)
    render({json: {success: true}})
  end

  private

  def like_params
    params.require(:like).permit(:id, :post_id)
  end
end
