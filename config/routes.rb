Rails.application.routes.draw do
  root to: 'pages#home'


  #CRUD
  resources :users
  resources :airplanes
  resources :flights

  get 'flights/search/:origin/:destination' => 'flights#search'


end
