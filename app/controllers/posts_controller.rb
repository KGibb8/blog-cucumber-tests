class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    current_user.posts.create(post_params)
  end

  def show
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    user = @post.user
    @post.destroy
    redirect_to user_posts_path(user)
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end

