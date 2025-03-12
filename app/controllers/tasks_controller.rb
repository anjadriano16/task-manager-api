class TasksController < ApplicationController
    before_action :authenticate_user!
  
    def index
      tasks = current_user.tasks.includes(:category)
      render json: tasks, include: :category
    end
  
    def create
      task = current_user.tasks.new(task_params)
      if task.save
        broadcast_task(task, 'created')
        render json: task, status: :created
      else
        render json: task.errors, status: :unprocessable_entity
      end
    end
  
    def update
      task = current_user.tasks.find(params[:id])
      if task.update(task_params)
        broadcast_task(task, 'updated')
        render json: task
      else
        render json: task.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      task = current_user.tasks.find(params[:id])
      task.destroy
      broadcast_task(task, 'deleted')
      head :no_content
    end
  
    private
  
    def task_params
      params.require(:task).permit(:title, :description, :due_date, :completed, :category_id, :assigned_to)
    end
  
    def broadcast_task(task, action)
      ActionCable.server.broadcast "task_channel", { task: task, action: action }
    end
  end
  