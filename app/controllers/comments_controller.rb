class CommentsController < ApplicationController


  def index
    @comments = Comment.all

    respond_to do |format|
      format.html
      format.json { render json: @comments }
    end
  end



  def show
    @comment = Comment.find(params[:id])
  end



  def new
    @comment = Comment.new
    @task = Task.find(params[:id])
  end


  def edit
    @comment = Comment.find(params[:id])
  end



  def create
    @comment = Comment.new(params[:comment])
    @task = @comment.task_id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to task_path(@task), notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end



  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @task = @comment.task_id

    respond_to do |format|
      format.html { redirect_to task_path(@task) }
      format.json { head :no_content }
    end
  end
end
