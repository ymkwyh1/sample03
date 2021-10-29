Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  resources :users, only: [:show] do
    resource :timeline, only: [:show]
  end

  resources :accounts, only: [:show]

  resources :posts 

  resource :profile 


end



