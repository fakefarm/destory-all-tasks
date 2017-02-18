class TasksController < ApplicationController
  include ApplicationHelper
  before_filter :authorize, :get_punts


  def index
    @task = Task.new
    @tasks = Task.where(user_id: current_user.id).where( 'due_date <= ? ', Time.now ).order('position')
    @page_title = "#{@tasks.count} #{@tasks.count == 1 ? 'task' : 'tasks'} to destroy!"
    @user = User.find(current_user.id)
    @comment = Comment.new

    respond_to do |format|
      format.html
      format.json{ render json: @tasks}
    end
  end

  def tags
    @task = Task.new
    tag_param = "%#{params[:tags]}%"
    @tasks = Task.tag(tag_param).current_user_id(current_user.id)
    @title = params[:tags]
    @comment = Comment.new
  end

  def untagged
    @task = Task.new
    tag_param = ""
    @tasks = Task.tag(tag_param).current_user_id(current_user.id)
    @title = params[:tags]
    @comment = Comment.new
  end

  def punted
    @tasks = Task.current_user_id(current_user.id).punted
  end

  def punt_all_tasks
    tag = request.referrer.split('/').last
    if tag == 'tasks'
      to_punt = Task.where('due_date <= ?', Time.now)
      to_punt.each do |task|
        task.update_attributes(due_date: punt_time )
      end
    else
      tag = request.referrer.split('/').last
      PuntAllTaggedTasksService.call(tag)
    end

    respond_to do |format|
      format.html { redirect_to tasks_path, notice: "You punted all #{tag} tags." }
      format.js { render layout: false }
    end
  end

  def punt_all_tagged_tasks
    tag = request.referrer.split('/').last
    PuntAllTaggedTasksService.call(tag)
    redirect_to tasks_path,
      notice: "You punted all #{tag} tags."
  end

  def delete_all_tagged_tasks
    tag = request.referrer.split('/').last
    DeleteAllTaggedTasksService.call(tag)
    redirect_to tasks_path,
      notice: "You deleted all #{tag} tags."
  end


  def show
    begin
      @task       = Task.find(params[:id])

      if current_user.id != @task.user_id
        redirect_to tasks_path, notice: "Not your task to destroy."
      end

      @comment    = Comment.new
      @comments   = Comment.where(task_id: @task).order("created_at DESC")
      @page_title = @task.item
    rescue
      redirect_to tasks_path, notice: "Not your task to destroy."
    end
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
    @page_title = @task.item
  end

  def create
    @task = Task.new(task_params)
    @task.tags = @task.tags.gsub(' ', '')
    if @task.save
      if request.referrer.include?('tags')
        redirect_to tags_path(@task.tags)
      else
        redirect_to tasks_path
      end
    else
      render action: "new"
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
    if @task.save
      if request.referrer.include?('tags')
        redirect_to tags_path(@task.tags)
      else
        respond_to do |format|
          format.html { redirect_to tasks_path, notice: "Updated." }
          format.js { render layout: false }
        end
      end
    else
      render :back
      flash[:notice] = "Sorry, something went wrong."
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_path, notice: "destroyed!" }
      format.js   { render layout: false }
    end
  end

  def sort
    params['task-wrapper_task'].each_with_index do |id, index|
      Task.update_all({position: index + 1}, {id: id})
    end
    render nothing: true
  end

private

  def get_punts
    @punts = Task.where('due_date > ?', Time.now).where(user_id: current_user.id)
    @punt_count = @punts.count
  end

  def task_params
    params.require(:task).permit(:completed, :item, :tags, :feature, :position, :due_date, :user_id)
  end

end
