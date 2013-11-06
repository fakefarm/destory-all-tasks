class TagsController < ApplicationController
  def edit_multiple
    @tasks = Task.find(params[:tags])
  end

  def update_multiple
    @tasks = Task.find(params[:tags])
    @task.each do |tag|
      tag.update_attributes!(params[:tags].reject { |k,v| v.blank? })
    end
    flash[:notice] = "Tag Updated!"
    redirect_to tasks_path
  end
end


