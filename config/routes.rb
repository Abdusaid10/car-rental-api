Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cars#index'

  resources :users
  resources :bookings
  resources :manufacturers, constrains: -> request { request.format == :json }
  resources :cars
  resources :categories

end
