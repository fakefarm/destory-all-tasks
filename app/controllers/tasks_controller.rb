class TasksController < ApplicationController

  before_filter :authorize
  before_filter :get_punts

  def tags
    @task = Task.new
    tag = "%#{params[:tags]}%"
    @tasks = Task.where("tags like ?", tag).where(user_id: current_user.id)
    @title = params[:tags]
  end

  def index
    @tasks = Task.where(user_id: current_user.id).order('position')
    @task = Task.new
    @page_title = "#{@tasks.count} #{@tasks.count == 1 ? 'task' : 'tasks'} to destroy!"
    @user = User.find(current_user.id)
    # @counter = @user.task_counter.quantity
  end

  def punted
    @tasks = Task.where('due_date > ?', Time.now).where(user_id: current_user.id)
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
    @task = Task.new(params[:task])
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
    if @task.update_attributes(params[:task])
      if request.referrer.include?('tags')
        redirect_to tags_path(@task.tags)
      else
        redirect_to tasks_path
      end
    else
      render action: "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    # @counter = current_user.task_counter
    # qty = current_user.task_counter.quantity + 1
    # @counter.update_attributes(quantity: qty)
    if request.referrer.include?('tags')
      redirect_to tags_path(@task.tags)
    else
      redirect_to tasks_path
    end
  end

  def sort
    params[:task].each_with_index do |id, index|
      Task.update_all({position: index + 1}, {id: id})
    end
    render nothing: true
  end

private

  def get_punts
    @punts = Task.where('due_date > ?', Time.now).where(user_id: current_user.id)
    @punt_count = @punts.count
  end
end
