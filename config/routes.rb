Rails.application.routes.draw do
  devise_for :users

  resources :kindles
  resources :books do
    resources :articles, only: [:index, :create]
    get 'publish' => 'articles#publish'
  end
  resources :articles, except: [:index, :create]

  namespace :api, module: nil, defaults: {format: :json} do
    resources :kindles, only: [:index, :show, :create, :update, :destroy]
    resources :books, only: [:index, :show, :create, :update, :destroy] do
      resources :articles, only: [:index, :create]
      get 'publish' => 'articles#publish'
    end
    resources :articles, only: [:show, :update, :destroy]
  end

  root 'books#index'
end
