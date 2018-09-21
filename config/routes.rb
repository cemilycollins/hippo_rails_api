Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :create, :update, :destroy, :show]
  resources :reviews, only: [:create, :update, :destroy]
  resources :hospitals, only: [:index]

  post '/login', to: 'auth#login'

  get '/me', to: 'users#me'
end
