Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  resources :restaurants do
    resources :devices
  end
  resources :maintainers
end
