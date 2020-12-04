Rails.application.routes.draw do
  resources :tags
  resources :languages
  resources :snippets
  root to: 'snippets#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
