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
  get '/cities/:city_id/teams/edit', to: 'cities#edit', as: 'edit_city_team'
  patch '/cities/:city_id/teams/team_id', to: 'cities#update'
  delete '/cities/:city_id/teams/team_id', to: 'cities#destroy'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'


end
