TheGradList2::Application.routes.draw do
  devise_for :users
  root :to => 'home#index'

  resources :items, only: [:new, :create, :destroy] do
    collection do
      put 'done'
    end
  end

  resources :user, only: [:show] do
    collection do
      put 'follow'
    end
  end
  
  resources :items
end
