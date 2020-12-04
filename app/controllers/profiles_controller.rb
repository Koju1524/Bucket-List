class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.prepare_profile
  end

  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profile_paramas)
    if @profile.save
      redirect_to profile_path, notice: 'Successful Edit !!'
    else
      flash.now[:error] = 'Failed Edit'
      render :edit
    end
  end

  private
  def profile_paramas
    params.require(:profile).permit(
          :bio,
          :location,
          :birthday,
          :avatar
        )
  end

end
