Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks do
    collection do
      post :get_started_day
      post :get_finished_day
      post :order_tasks_asc
      post :order_tasks_desc
      get :search
    end
  end
end
