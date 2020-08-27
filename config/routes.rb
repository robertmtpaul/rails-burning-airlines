Rails.application.routes.draw do

  root to: 'pages#home'


  #session routes
  get '/login' => 'session#new' #login form
  post '/login' => 'session#create' #form submit and authenticate
  delete '/login' => 'session#destroy' #logout

  #CRUD
  resources :users
  resources :airplanes
  resources :flights

  get 'flights/search/:origin/:destination' => 'flights#search'
  get 'airports' => 'pages#airports'


end
