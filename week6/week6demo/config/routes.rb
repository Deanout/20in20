# frozen_string_literal: true

Rails.application.routes.draw do
  root 'games#index'
  post 'games/search'
  resources :genres
  resources :games
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
