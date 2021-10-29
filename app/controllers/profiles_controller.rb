class ProfilesController < ApplicationController 

  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def show
  end

  def edit
    @profile = current_user.profile || current_user.build_profile
  end

  def update
    @profile = current_user.profile || current_user.build_profile
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to user_path(id: current_user.id), notice: 'Updated!'
    else
      flash.now[:error] = 'Failed to update!'
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(
      :name,
      :introduction,
      :avatar
    )
  end
end