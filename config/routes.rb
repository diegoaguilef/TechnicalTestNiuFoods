require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  get 'home/index'
  root 'home#index'
  resources :restaurants do
    resources :devices
  end
  resources :maintainers
end
