Rails.application.routes.draw do
  root 'pages#main'
  #get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/auth/:provider/callback' => 'sessions#create'
  #get '/auth/google/callback' => 'sessions#create'
  #get '/auth/facebook/callback' => 'sessions#create'
  delete '/sessions/:id' => 'sessions#destroy'
  resources :users do
    resources :recipes
  end
  resources :sessions
  resources :ingredients
  resources :users
  resources :recipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
