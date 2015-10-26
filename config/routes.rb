Rails.application.routes.draw do

  resources :posts
  resources :users
  get     '/login',     to: 'sessions#new',        as: 'new_login'
  post    '/login',     to: 'sessions#create',     as: 'login'
  delete  '/logout',    to: 'sessions#destroy',    as: 'logout'

  resources :blogs
  resources :comments

  root "users#new"
end
