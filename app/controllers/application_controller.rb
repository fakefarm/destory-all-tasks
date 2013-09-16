class ApplicationController < ActionController::Base
  protect_from_forgery

private

  def current_user # Doing railscast, but I think this overrides clearance.
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
