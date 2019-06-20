Rails.application.routes.draw do

  get 'organizer/new'
  get 'organizer/delete'
  get 'parties/index'
  get 'parties/show'
  get 'parties/new'
  get 'parties/create'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'members/index'
  get 'members/show'
  get 'members/new'
  get 'members/create'
  root to: 'toppages#index'
  get 'signup', to: 'members#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'organizer_login', to: 'organizer#new'
  post 'organizer_login', to: 'organizer#create'
  delete 'organizer_logout', to: 'organizer#delete'
  

  resources :members
  resources :parties
  resources :registrations
  resources :requests
  
end
