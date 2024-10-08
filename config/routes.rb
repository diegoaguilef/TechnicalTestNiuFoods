require 'sidekiq/web'
Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  get 'home/index'
  resources :restaurants do
    resources :devices
  end
  resources :maintainers
end
