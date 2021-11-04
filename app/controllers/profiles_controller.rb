class ProfilesController < ApplicationController 

  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_profile, only: [:edit, :update]

  def edit
  end

  def update
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

  def set_profile
    @profile = current_user.profile || current_user.build_profile
  end

end