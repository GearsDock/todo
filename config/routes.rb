Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root 'tasks#index'
  
  resources :users
  
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  

  resources :tasks do
    collection do
      post :get_started_day
      post :get_finished_day
      post :order_tasks_asc
      post :order_tasks_desc
      post :order_planned_finished_at_asc
      post :order_planned_finished_at_desc      
      post :order_priority_asc
      post :order_priority_desc      
      post :order_status_asc
      post :order_status_desc      
      get :search
    end
  end
end
