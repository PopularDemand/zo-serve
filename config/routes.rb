Rails.application.routes.draw do
  resources :users, only: [:show, :create, :index]
  delete 'signout'   => 'sessions#destroy'
  post   'signin'    => 'sessions#create'
end
