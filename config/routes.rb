Rails.application.routes.draw do
  devise_for :users, :controllers => { sessions: 'sessions', registrations: 'registrations' }

  resources :teams do
    resources :team_members, only: [:create, :destroy]
  end

  resources :events, only: [:index, :show]
  resources :events_teams

  namespace :api, defaults: { format: 'json '} do
    get 'teams/search', to: 'teams#search'
    resources :teams
    resources :events
  end

  post '/api-keys', to: 'api_keys#create'
  delete '/api-keys', to: 'api_keys#destroy'
  get '/api-keys', to: 'api_keys#index'

  root to: 'teams#index'
end
