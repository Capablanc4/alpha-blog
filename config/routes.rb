Rails.application.routes.draw do
  resources :articles
  get 'about', to: 'pages#about'  
  root 'pages#home'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]
  get "up" => "rails/health#show", as: :rails_health_check
end
