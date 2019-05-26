Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks do
    collection do
      post :get_started_day
      post :get_finished_day
    end
  end
end
