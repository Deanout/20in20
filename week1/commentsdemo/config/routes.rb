# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  get 'history', to: 'comments#history'

  devise_for :users
  root 'posts#index'
  get 'about', to: 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
