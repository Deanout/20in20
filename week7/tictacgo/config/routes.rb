Rails.application.routes.draw do
  root 'pages#home'
  get 'game', to: 'pages#game'
  get 'hiscores', to: 'pages#hiscores'
  post '/played', to: 'pages#played'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
