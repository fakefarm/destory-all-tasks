class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
        CreateProfileObserver.call(@user)
        cookies[:auth_token] = @user.auth_token
        redirect_to tasks_path, notice: "Destroy some!"
    else
      render 'new'
    end
  end
end

