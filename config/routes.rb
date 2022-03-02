Rails.application.routes.draw do
  root 'pages#home'

  # About page
  get 'about', to: 'pages#about'

  # Signup page
  get 'signup', to: 'users#new'

  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :articles

  resources :users, except: [:new]
end
