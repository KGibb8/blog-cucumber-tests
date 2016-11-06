class ProfilesController < ApplicationController

  def create
    current_user.create_profile
    redirect_to profile_path current_user.profile
  end

  def show
    @profile = Profile.find_by(user_id: params[:user_id])
    unless @profile
      # In future, redirect to custom 404 page
      redirect_to user_profile_path current_user.profile
    end
  end

  def update
    current_user.update_profile(profile_params)
    redirect_to profile_path current_user.profile
  end

  private

  def profile_params
    params.required(:profile).permit(:username, :description, :avatar, :theme_color, :location, :website, photos: [])
  end

end
