Rails.application.routes.draw do

  root to: 'pages#home'


  #CRUD
  resources :users
  resources :airplanes
  resources :flights


end
