Rails.application.routes.draw do
  get 'sessions/new'
  resources :menuitems
  resources :orders
  resources :tables
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "users#index"
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :tables

  get '/signup', to: 'users#new', as: 'signup'
  get '/employees', to: 'users#employees', as: 'employees'

  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new', as: 'signin'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'auth/google_oauth2/callback', to: 'sessions#create'
end
