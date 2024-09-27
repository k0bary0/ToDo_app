class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      flash[:success] = "The task has been successfully created."
      redirect_to @task
    else
      flash.now[:alert] = @task.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      flash[:success] = "The task has been successfully updated."
      redirect_to @task
    else
      flash.now[:alert] = @task.errors.full_messages.join(", ")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    flash[:success] = "The task has been successfully deleted."
    redirect_to user_path(current_user), status: :see_other
  end

  private

    def set_task
      @task = current_user.tasks.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The task can not be found."
      redirect_to tasks_path
    end

    def task_params
      params.require(:task).permit(:title, :description)
    end
end
