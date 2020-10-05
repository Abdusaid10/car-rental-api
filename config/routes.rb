Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cars#index'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#i_logged_in?'

  post '/signup', to: 'users#create'
  get '/user', to: 'users#show'
  get '/users', to: 'users#index'
  # resources :users, only: [:create, :show, :index]
  resources :bookings
  resources :manufacturers
  resources :cars
  resources :categories
end
