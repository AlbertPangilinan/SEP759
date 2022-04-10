Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  get '/login' => 'sessions#new', as: 'login'
  delete '/logout' => 'sessions#destroy', as: 'logout'

  resources :teams do
    resources :team_members, only: [:create, :destroy]
  end

  resources :events, only: [:index, :show]
  resources :events_teams

  root to: 'teams#index'
end
