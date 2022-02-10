Rails.application.routes.draw do
  root 'pages#home'

  # About page
  get 'about', to: 'pages#about'
end
