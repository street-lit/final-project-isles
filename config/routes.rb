Rails.application.routes.draw do

  get '/about',         to: "landing_pages#about", as: "about"

  # get     '/login',     to: 'sessions#new',        as: 'new_login'
  # post    '/login',     to: 'sessions#create',     as: 'login'
  # get     '/logout',    to: 'sessions#destroy',    as: 'logout'
  get     '/home',      to: "users#home",          as: "home"

  resources :users
  resources :blogs
  resources :posts
  resources :comments

  controller :sessions do
    get 'login' => :new
    post 'login'=> :create
    get 'logout' => :destroy
  end

  root "landing_pages#about"
end
