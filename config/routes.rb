Rails.application.routes.draw do

  get '/about',         to: "landing_pages#about", as: "about"

  get     '/login',     to: 'sessions#new',        as: 'new_login'
  post    '/login',     to: 'sessions#create',     as: 'login'
  delete  '/logout',    to: 'sessions#destroy',    as: 'logout'
  get     '/home',      to: "users#home",          as: "home"

  resources :users
  resources :blogs
  resources :posts
  resources :comments

  root "users#new"
end
