Rails.application.routes.draw do
 
  # get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/:provider/callback' => 'sessions#create'

  root to: 'static#welcome'

  # get '/', to: 'static#welcome'
  get '/about', to: 'static#about'

  get '/search', to: 'trails#trails_search'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
 
  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
 
  #logout route
  delete '/logout' => 'sessions#destroy'
  

  resources :hikes
  resources :trails do 
    resources :hikes
  end
  resources :users do
    resources :hikes
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
