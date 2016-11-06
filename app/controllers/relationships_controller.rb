class RelationshipsController < ApplicationController
  def create
    current_user.follow User.find(params[:user_id])
    render json: {follows: true}
  end

  def destroy
    current_user.unfollow User.find(params[:id])
    render json: {follows: false}
  end
end
