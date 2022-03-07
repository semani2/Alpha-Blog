Rails.application.routes.draw do
  root 'pages#home'

  # About page
  get 'about', to: 'pages#about'

  # Signup page
  get 'signup', to: 'users#new'

  # Login page
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :articles

  resources :users, except: [:new]
end
