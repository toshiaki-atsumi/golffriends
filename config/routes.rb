Rails.application.routes.draw do

  get 'schedules/index'
  get 'schedules/create'
  get 'schedules/edit'
  get 'schedules/show'
  get 'schedules/update'
  get 'schedules/destroy'
  get 'index/create'
  get 'index/edit'
  get 'index/show'
  get 'index/update'
  get 'index/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

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
  
end
