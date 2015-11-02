Rails.application.routes.draw do

  resources :messages
  resources :conversations
  resources :conversations
  get     '/login',     to: 'sessions#new',        as: 'new_login'
  post    '/login',     to: 'sessions#create',     as: 'login'
  delete  '/logout',    to: 'sessions#destroy',    as: 'logout'
  get     '/home',      to: "users#home",          as: "home"

  put 'requests/deny', as: 'deny'
  put 'requests/accept', as: 'accept'

  get '/about',         to: "landing_pages#about", as: "about"

  resources :users
  resources :blogs
  resources :posts
  resources :comments
  resources :friends
  resources :requests
  resources :observations
  resources :photos
  resources :albums

  root "landing_pages#about"
end
