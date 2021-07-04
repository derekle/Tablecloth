Rails.application.routes.draw do
  get 'sessions/new'
  resources :menuitems
  resources :orders
  resources :tables
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "users#index"
  
  resources :sessions, only: [:new, :create, :destroy]

  get '/tables/:id:/edit', to: 'tables#edit'
  get '/signup', to: 'users#new', as: 'signup'
  get '/employees', to: 'users#employees', as: 'employees'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new', as: 'signin'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'auth/google_oauth2/callback', to: 'sessions#create'
  post '/tables/:id(.:format)', to: 'tables#stageup', as: 'stageup'
  post '/orders/:id(.:format)', to: 'orders#pay#', as: 'pay'
  get '/home', to: 'sessions#show', as: 'home'
end
