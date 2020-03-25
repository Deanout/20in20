# frozen_string_literal: true

Rails.application.routes.draw do
  resources :items
  root 'pages#home'
  get 'menu', to: 'pages#menu'
  get 'catering', to: 'pages#catering'
  get 'info', to: 'pages#info'
  get 'reviews', to: 'pages#reviews'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
