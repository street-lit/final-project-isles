Rails.application.routes.draw do


  get     '/login',     to: 'sessions#new',        as: 'new_login'
  post    '/login',     to: 'sessions#create',     as: 'login'
  delete  '/logout',    to: 'sessions#destroy',    as: 'logout'
  get     '/home',      to: "users#home",          as: "home"

  put 'requests/deny', as: 'deny'
  put 'requests/accept', as: 'accept'

  get '/about',         to: "landing_pages#about", as: "about"

  resources :users
  resources :blogs
  resources :posts, only: [:new, :show, :create, :edit, :update, :destroy]
  resources :comments, only: [:show, :create, :edit, :update, :destroy]
  resources :friends
  resources :requests
  resources :observations, only: [:show, :create, :edit, :update, :destroy]
  resources :photos, only: [:new, :show, :create, :edit, :update, :destroy]
  resources :albums
  resources :events
  resources :conversations, only: [:index, :show, :create, :destroy]
  resources :messages, only: [:new, :create, :destroy]
  resources :conversations

  root "landing_pages#about"
end
