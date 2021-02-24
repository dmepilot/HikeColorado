Rails.application.routes.draw do
  resources :hikes
  resources :trails
  resources :users
  get '/', to: 'static#welcome'
  get 'about', to: 'static#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
