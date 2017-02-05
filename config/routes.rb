Rails.application.routes.draw do
  root 'pages#main'
  get '/auth/twitter/callback' => 'sessions#create'
  get '/auth/google/callback' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'
  resources :sessions
  resources :ingredients
  resources :users
  resources :recipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
