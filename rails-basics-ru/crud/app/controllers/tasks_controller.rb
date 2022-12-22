class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find params[:id]
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new task_params

    if @task.save
      flash[:success] = 'New task was successfully created'

      redirect_to @task
    else
      flash[:failure] = 'Task cannot be created'

      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @task = Task.find params[:id]

    if @task.update task_params
      flash[:success] = 'Task was successfully updated'

      redirect_to @task
    else
      flash[:failure] = 'Task cannot be updated'

      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find params[:id]
    
    if @task.destroy
      flash[:success] = 'Task was successfully deleted'

      redirect_to tasks_path
    else
      flash[:failure] = 'Task cannot be deleted'

      render :edit, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.required(:task).permit(:name, :description, :status, :creator, :performer, :completed)
  end
end
