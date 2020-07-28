Rails.application.routes.draw do
  root 'users#new'
  post 'sessions/create'
  resources :sessions, only: [:new, :create]
  resources :users, only: [:index, :new, :create]
  #get 'users/index'
  #get 'users/new'
  #post 'users/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
