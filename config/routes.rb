Rails.application.routes.draw do
  devise_for :users

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

  root to: 'teams#index'
end
