class UsersController < ApplicationController
  before_filter :require_admin, only: [:index]

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

