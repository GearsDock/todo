  class TasksController < ApplicationController
    def index
      @tasks = Task.all
    end
 
  
    def new
       @task = Task.new
    end
    
    def show
    @task = Task.find(params[:id])
    end
    
    

    def create
      @task = Task.create(task_params)
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
    
    #パラメータでIDを渡す。button_to
    def get_started_day
      @task = Task.find(params[:task_id])
      @task.started_at  = Time.new
      @task.save
      redirect_to tasks_path
    end
    
    def get_finished_day
      @task = Task.find(params[:task_id])
      @task.finished_at  = Time.new
      @task.status  = 3
      @task.save
      redirect_to tasks_path
    end
    
    
    
    private
      def task_params
       params.require(:task).permit(:title, :description, :planned_finished_at, :priority, :status, :started_at, :finished_at)
      end
  end