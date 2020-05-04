# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  post '/played', to: 'pages#played'
  root 'pages#home'
  get 'hiscores', to: 'pages#hiscores'
  get '/game', to: 'pages#game'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
