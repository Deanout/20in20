# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :menu, only: [:index]
  resources :products
  resources :order_items
  resources :charges
  get 'cart', to: 'cart#show'
  root 'menu#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
