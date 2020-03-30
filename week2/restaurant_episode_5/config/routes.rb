# frozen_string_literal: true

Rails.application.routes.draw do
  resources :order_items
  get 'cart', to: 'cart#show'
  get 'search', to: 'menu#search'
  resources :categories
  get 'menu', to: 'menu#index'
  devise_for :users
  resources :products
  root 'pages#home'
  get 'catering', to: 'pages#catering'
  get 'info', to: 'pages#info'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
