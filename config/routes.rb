Rails.application.routes.draw do



  root to: 'toppages#index'
  get 'signup', to: 'members#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  

 
  resources :members
  resources :parties
  resources :registrations
  resources :requests
  resources :schedules
  resources :participants
end
