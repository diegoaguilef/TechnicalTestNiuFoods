Rails.application.routes.draw do
  get 'csrf_token', to: 'application#csrf_token'

  get 'home/index'
  root 'home#index'
  resources :restaurants do
    resources :devices
  end
  resources :maintainers
end
