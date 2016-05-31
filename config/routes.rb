Rails.application.routes.draw do

  root to: 'welcome#index'

  get '/cities', to: 'cities#index', as: 'cities'
  get '/cities/new', to: 'cities#new'
  post '/cities', to: 'cities#create'
  get '/cities/:id', to: 'cities#show', as: 'city'
  get '/cities/:id/edit', to: 'cities#edit', as: 'edit_city'
  patch '/cities/:id', to: 'cities#update'
  # delete '/cities/:id', to: 'cities#destroy'

  get '/cities/:city_id/teams', to: 'teams#index', as: 'city_teams'
  get '/cities/:city_id/teams/new', to: 'teams#new', as: 'new_city_team'
  post '/cities/:city_id/teams', to: 'teams#create'
  get '/cities/:city_id/teams/:team_id', to: 'teams#show', as: 'city_team'
  get '/cities/:city_id/teams/:team_id/edit', to: 'teams#edit', as: 'edit_city_team'
  patch '/cities/:city_id/teams/:team_id', to: 'teams#update'
  delete '/cities/:city_id/teams/:team_id', to: 'teams#destroy', as: 'destroy_team'

  get '/cities/:city_id/teams/:team_id/memories', to: 'memories#index', as: 'team_memories'
  get '/cities/:city_id/teams/:team_id/memories/new', to: 'memories#new', as: 'new_team_memory'
  post '/cities/:city_id/teams/:team_id/memories', to: 'memories#create', as: 'city_team_memories'
  get '/cities/:city_id/teams/:team_id/memories/:memory_id', to: 'memories#show', as: 'team_memory'
  get '/cities/:city_id/teams/:team_id/memories/memory_id/edit', to: 'memories#edit', as: 'edit_team_memory'
  patch '/cities/:city_id/teams/:team_id/memories/memory_id', to: 'memories#update'
  delete '/cities/:city_id/teams/:team_id/memories/memory_id', to: 'memories#destroy', as: 'destroy_team_memory'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'


end
