TheGradList2::Application.routes.draw do
  devise_for :users
  root :to => 'home#index'

  resources :items, only: [:new, :create, :destroy] do
    collection do
      put 'done'
    end
  end

  resources :user, only: [:show] do
    member do
      get :following, :followers
    end
  end

  resources :items

  resources :relationships, only: [:create, :destroy]
end
