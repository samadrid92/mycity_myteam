Rails.application.routes.draw do

  root to: 'welcome#index'
  get 'welcome/index'

  get '/cities', to: 'cities#index', as: 'cities'
  get '/cities/new', to: 'cities#new'
  post '/cities', to: 'cities#create'
  get '/cities/:id', to: 'cities#show', as: 'city'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'


end
