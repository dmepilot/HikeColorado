Rails.application.routes.draw do
  resources :hikes
  resources :trails do 
    resources :hikes
  end
  resources :users do
    resources :hikes
  end


  get '/', to: 'static#welcome'
  get 'about', to: 'static#about'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
 
  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
 
  #logout route
  delete '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
