Rails.application.routes.draw do
  resources :articles
  get 'about', to: 'pages#about'  
  root 'pages#home'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]  

  get "up" => "rails/health#show", as: :rails_health_check
end
