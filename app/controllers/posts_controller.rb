class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update]

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

  private

  def post_params
    params.require(:post).permit(:body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end

