class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  
  def index 
    @tags = Tag.all.order(:name)
    @posts = Post.all
    @my_posts = current_user.posts
    @commented_posts = current_user.comments.map(&:post).uniq
    @post = Post.new
    @post.tags.build
  end

  def new
    @post = Post.new
    @post.comments.build
  end

  def create
    binding.pry
    post = current_user.posts.create(post_params)
    redirect_to post_path(post)
    # Post.create(post_params).to_h.merge(user_id: current_user.id) end
    # redirect_to post
  end

  def edit
    @tags = Tag.all.order(:name)
    @post.taggings.build
  end

  def show
    @comment = Comment.new
    @post_comments = @post.comments.order(:created_at)
    @like = Like.new
    # @post.comments.build
  end

  def update
    binding.pry
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    user = @post.user
    @post.comments.destroy_all
    @post.likes.destroy_all
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:id, :title, :body, {tag_ids: [] }) #, tags_attributes: [:id, :name])
  end

  def find_post
    @post = Post.find(params[:id])
  end
end

