class TasksController < ApplicationController

  before_filter :authorize

  def index
    @tasks = Task.find(:all, order: 'position')
    @punts = Task.where('due_date > ?', Time.now)
    @punt_count = @punts.count

    @task = Task.new
    @page_title = "#{@tasks.count} #{@tasks.count == 1 ? 'task' : 'tasks'} to destroy!"
    @counter = TaskCounter.all
  end

  def punted
    @tasks = Task.where('due_date > ?', Time.now)
  end

  def show
    @task       = Task.find(params[:id])
    @comment    = Comment.new
    @comments   = Comment.where(task_id: @task).order("created_at DESC")
    @page_title = @task.item
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
    if @task.save
      redirect_to tasks_path
    else
      render action: "new"
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to tasks_path
    else
      render action: "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    TaskCounter.create(quantity: 1)
    redirect_to tasks_path
  end

  def sort
    # require 'pry'; binding.pry
    params[:task].each_with_index do |id, index|
      Task.update_all({position: index + 1}, {id: id})
    end
    render nothing: true
  end
end
