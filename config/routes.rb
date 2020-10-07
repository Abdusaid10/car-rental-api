Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cars#index'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#i_logged_in?'

 
  resources :users
  resources :bookings
  resources :manufacturers
  resources :cars
  resources :categories
end
