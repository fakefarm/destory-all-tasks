class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env['omniauth.auth']) # where does from_omniauth come from? where / how is the env being set?
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end