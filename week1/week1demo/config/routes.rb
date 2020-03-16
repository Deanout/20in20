Rails.application.routes.draw do
  resources :posts
  get '/blog', to: 'posts#index'
  devise_for :users
  root 'posts#index'
  get 'about', to: 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
