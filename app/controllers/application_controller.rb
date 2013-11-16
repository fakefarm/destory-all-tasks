class ApplicationController < ActionController::Base
  before_filter :tag_cloud
  protect_from_forgery
private

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

  def tag_cloud # Refactor - shouldn't this go into Model? How?
    if !!current_user
      @task_tags = Task.where(user_id: current_user.id)
      @unique_tags = []
      @tags = @task_tags.each do |task|
        task.tags.split(',').each do |tag|
          unless tag.include?('$') || tag.include?('@') || !!tag.match(/[0-9]+(h|m)/) || tag.empty?
            @unique_tags << tag.strip
          end
        end
      end
      @tags = @unique_tags.compact.uniq.sort
      @tags
    end
  end
end
