Rails.application.routes.draw do
  root 'articles#index'
  post 'sessions/create'
  resources :articles, only: [:index, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
