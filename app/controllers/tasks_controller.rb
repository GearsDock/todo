  class TasksController < ApplicationController
    def index
      if logged_in?
       @tasks = current_user.tasks
      end
    end
 
  
    def new
       @task = Task.new
       @user_id = params[:user_id]
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
    
    #パラメータでIDを渡す。button_to
    def get_started_day
      @task = Task.find(params[:task_id])
      @task.started_at  = Time.new
      @task.save
      redirect_to tasks_path
    end
    
    def get_finished_day
      @task = Task.find(params[:task_id])
      @task.update!(finished_at: Time.new, status: :finished)
      redirect_to tasks_path
    end
    
    
    def order_tasks_asc
      @tasks = Task.all.order(title: "ASC")
      render template: "tasks/index"
    end
    
    def order_tasks_desc
      @tasks = Task.all.order(title: "DESC")
      render template: "tasks/index"
    end
    
    def order_planned_finished_at_asc
      @tasks = Task.all.order(planned_finished_at: "ASC")
      render template: "tasks/index"
    end
    
    def order_planned_finished_at_desc
      @tasks = Task.all.order(planned_finished_at: "DESC")
      render template: "tasks/index"
    end
    
    def order_priority_asc
      @tasks = Task.all.order(priority: "ASC")
      render template: "tasks/index"
    end
    
    def order_priority_desc
      @tasks = Task.all.order(priority: "DESC")
      render template: "tasks/index"
    end
    
    def order_status_asc
      @tasks = Task.all.order(status: "ASC")
      render template: "tasks/index"
    end
    
    def order_status_desc
      @tasks = Task.all.order(status: "DESC")
      render template: "tasks/index"
    end
    
    def search
        @tasks = Task.search(params[:q])
        render "index"
    end
    
    
    
    
    private
    
      def task_params
       params.require(:task).permit(:title, :description, :planned_finished_at,
       :priority, :status, :started_at, :user_id)
      end
      
 
  end