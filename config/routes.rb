Rails.application.routes.draw do
  root 'pages#home'

  # About page
  get 'about', to: 'pages#about'

  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :articles
end
