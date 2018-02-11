Rails.application.routes.draw do

  root 'welcome#home'

  resources :users
  resources :restaurants
  resources :reviews, only: [:index, :show]
  resources :food_types

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/:username', to: 'users#show'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :users do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end


 end
