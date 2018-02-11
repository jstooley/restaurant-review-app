Rails.application.routes.draw do

  root 'welcome#home'

  resources :users
  resources :restaurants
  resources :reviews
  resources :food_types

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/:username', to: 'users#show'

 end
