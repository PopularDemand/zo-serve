Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users, only: [:show, :create, :index]
  resources :games, only: [:create]
  delete 'signout'   => 'sessions#destroy'
  post   'signin'    => 'sessions#create'
end
