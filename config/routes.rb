Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :update, :destroy, :show]
  resources :reviews, only: [:create, :update, :destroy]
  resources :hospitals, only: [:index, :show]
  resources :procedures, only: [:index, :show]

  get '/hospitalquery', to: 'hospitals#location'

  post '/hospitalquery', to: 'hospitals#location'

  post '/login', to: 'auth#login'

  get '/me', to: 'users#me'
end
