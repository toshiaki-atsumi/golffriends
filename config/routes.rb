Rails.application.routes.draw do



  root to: 'toppages#index'
  get 'signup', to: 'members#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'organizer',to: 'member#organizer'
  post 'organizer',to:'parties#organizer'
  

 
  resources :members
  resources :parties
  resources :registrations
  resources :requests
  resources :schedules
  resources :participants
end
