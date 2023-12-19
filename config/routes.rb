Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  resources :users
  resources :books, except: [:update]
  patch 'books/:id/update', to: 'books#update', as: 'update_book'
  get 'homes/about', to: 'homes#about', as: 'about'


end
