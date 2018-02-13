Rails.application.routes.draw do

  root 'welcome#home'

  resources :users
  resources :restaurants
  resources :reviews, only: [:index, :destroy]
  resources :food_types, only: [:new]

  get '/highest_rated' => 'restaurants#rating'
  post '/destroy_rf' => 'restaurant_foods#destroy'
  post '/create_food_type' => 'food_types#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/auth/github' => 'github_outh'
  match '/auth/github/callback' => 'authentications#create', :via => [:get, :post]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/:username', to: 'users#show'
  post '/logout' => 'sessions#destroy'


  resources :users do
    resources :reviews, only: [:index, :show, :new, :create, :edit, :update]
  end


 end
