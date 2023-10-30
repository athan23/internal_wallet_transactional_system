Rails.application.routes.draw do
  resources :deposit, only: [:create]
  resources :transfer, only: [:create]
  resources :withdraw, only: [:create]

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
