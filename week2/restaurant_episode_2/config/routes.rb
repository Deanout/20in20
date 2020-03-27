# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :products
  root 'pages#home'
  get 'catering', to: 'pages#catering'
  get 'info', to: 'pages#info'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
