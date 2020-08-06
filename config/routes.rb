Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'

  resources :sessions, only: [:new, :create]
  resources :users, only: [:index, :new, :create, :show]
  resources :articles, only: [:index, :new, :create, :show, :edit, :update]
  resources :categories, only: [:index, :show]
  resources :votes, only: [:create]
  resources :save_articles, only: [:create, :destroy]

  delete 'sessions', to: 'sessions#destroy', as: 'delete_session'
  delete 'articles/:id', to: 'articles#destroy', as: 'delete_article'
  delete 'categories/:id', to: 'categories#destroy', as: 'delete_category'
  post 'categories/create', to: 'categories#create'
  delete 'votes/:id', to: 'votes#destroy', as: 'delete_vote'
  get 'save_articles/:id', to: 'save_articles#index', as: 'saved_articles_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
