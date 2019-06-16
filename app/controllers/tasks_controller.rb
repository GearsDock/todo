  class TasksController < ApplicationController
    before_action :logged_in?

    def index

    end
 
  
    def new
       @task = current_user.tasks.new
       @task = Task.new
    end
    
    def show
    @task = Task.find(params[:id])
    end
    

    def create
      @task = current_user.tasks.new(task_params)
      @task.save
      redirect_to tasks_path
    end
    
    def edit
      @task = Task.find(params[:id])
    end
    
    def update
      @task = Task.find(params[:id])
      @task.update(task_params)
      redirect_to tasks_path
    end
    
    def destroy
      @task = Task.find(params[:id])
      @task.destroy
      redirect_to tasks_path
    end
    
    
    def get_started_day
      @task = Task.find(params[:task_id])
      @task.update!(started_at: Time.new, status: :doing)
      redirect_to tasks_path
    end
    
    def get_finished_day
      @task = Task.find(params[:task_id])
      @task.update!(finished_at: Time.new, status: :finished)
      redirect_to tasks_path
    end
    
    
    def order_tasks
      @tasks = current_user.tasks.order(params[:column] + ' ' + params[:order])
      render template: "tasks/index"
    end
      
    
    private
    
      def task_params
       params.require(:task).permit(:title, :description, :planned_finished_at,
       :priority, :status, :started_at, :user_id)
      end
      
 
  end