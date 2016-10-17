class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  
  def index 
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.create(post_params)
    redirect_to root_path
    # Post.create(post_params).to_h.merge(user_id: current_user.id) end
    # redirect_to post
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
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end

