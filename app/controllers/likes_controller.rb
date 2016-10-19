class LikesController < ApplicationController
  def create
    # like = Like.create(post_id: params[:like][:post_id], user_id: current_user.id)
    # like = Like.create(like_params)
    # like = current_user.likes.create(post_id: params[:like][:post_id])
    like = current_user.likes.create(like_params)
    render {json: {success: true}}
  end

  def destroy
    # current_user.likes.destroy(post_id: params[:like][:post_id])
    current_user.likes.destroy(like_params)
    render {json: {success: true}}
  end

  private

  def like_params
    # params.require(:like).permit(:post_id)
  end
end
