Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  resources :users, only: [:show] do
    resource :timeline, only: [:show]
    resource :follower, only: [:show]
    resource :following, only: [:show]
  end

  resources :accounts, only: [:show] do
    resource :follows, only: [:create]
    resource :unfollows, only: [:create]
  end

  resources :posts do
    resources :comments, only: [:index, :new, :create]
    resource :like, only: [:create, :destroy]
  end

  resource :profile 


end



