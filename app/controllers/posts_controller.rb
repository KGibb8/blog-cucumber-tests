class PostsController < ApplicationController

  def index
  end

  def new
    @post = Post.new
  end

  def create
    current_user.posts.create(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end

