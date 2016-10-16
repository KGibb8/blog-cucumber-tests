class UsersController < ApplicationController

  before_action :find_user, only: [:posts]
  
  def posts
    @posts = @user.posts
  end

  private

  def find_user
    @user= User.find(params[:id])
  end

end

