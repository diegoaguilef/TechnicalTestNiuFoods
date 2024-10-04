Rails.application.routes.draw do
  resources :devices
  resources :categories
  resources :restaurants
  resources :communes
  resources :cities
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
