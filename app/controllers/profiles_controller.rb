class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(current_user.profile.id)
  end

  def edit
    @profile = Profile.find(current_user.profile_id)
    @users = @profile.users
  end

  def update
    @profile = Profile.find(current_user.profile_id)
    @profile.update_attributes(name: params[:profile][:name])
    User.find(current_user.id).update_attributes(params[:profile][:user])
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end
end
