Rails.application.routes.draw do

  get     '/login',     to: 'sessions#new',        as: 'new_login'
  post    '/login',     to: 'sessions#create',     as: 'login'
  delete  '/logout',    to: 'sessions#destroy',    as: 'logout'
  get     '/home',      to: "users#home",          as: "home"

  get '/about',         to: "landing_pages#about", as: "about"

  put 'requests/deny', as: 'deny'
  put 'requests/accept', as: 'accept'

  resources :albums
  resources :blogs
  resources :comments, only: [:show, :create, :edit, :update, :destroy]
  resources :conversations, only: [:index, :show, :create, :destroy]
  resources :events
  resources :friends, only: [:index, :create, :destroy]
  resources :messages, only: [:create, :destroy]
  resources :observations, only: [:show, :create, :edit, :update, :destroy]
  resources :photos, only: [:new, :show, :create, :edit, :update, :destroy]
  resources :posts, only: [:new, :show, :create, :edit, :update, :destroy]
  resources :requests, only: [:accept, :deny, :create, :destroy]
  resources :users

  root "landing_pages#about"
end
