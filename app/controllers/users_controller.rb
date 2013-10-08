class UsersController < ApplicationController
  before_filter :authorize, except: 'new'

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to tasks_url, notice: 'Get ready to destroy some tasks!'
    else
      render 'new'
    end
  end
end

