Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #CRUD
  resources :users
  resources :airplanes
  resources :flights


end
