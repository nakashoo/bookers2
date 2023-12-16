Rails.application.routes.draw do
  get 'homes/top'
  devise_for :users
  root to: 'homes#top'
  get 'homes/about', to: 'homes#about', as: 'about'
end
