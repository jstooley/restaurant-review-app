Rails.application.routes.draw do
  root 'welcome#home'
  resources :users
  resources :restaurants
  resources :reviews
  resources :food_types
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
end
