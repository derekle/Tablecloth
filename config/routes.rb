Rails.application.routes.draw do
  get 'sessions/new'
  resources :menuitems
  resources :orders
  resources :tables
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "sessions#show", as: 'home'
  
  resources :sessions, only: [:new, :create, :destroy]

  get '/tables/:id:/edit', to: 'tables#edit', as: "tableedit"
  get '/signup', to: 'users#new', as: 'signup'
  get '/employees', to: 'users#employees', as: 'employees'
  post '/signup', to: 'users#create'
  delete '/users/:id(.:format)', to: 'users#destroy', as: 'deleteuser'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as:'logout'
  get 'auth/google_oauth2/callback', to: 'sessions#create'
  post '/tables/:id(.:format)', to: 'tables#stageup', as: 'stageup'
  get 'tables/:id/orders/:id(.:format)', to: 'orders#edit#', as: 'tableorder'
  post 'tables/:id/orders/:id(.:format)', to: 'orders#pay#', as: 'pay'
  patch 'tables/:id/orders/:id(.:format)', to: 'orders#update#', as: 'updateorder'
  delete '/tables/:id(.:format)', to: 'tables#destroy', as:'deletetable'
end
