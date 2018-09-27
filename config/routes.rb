Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :update, :destroy, :show]
  resources :reviews, only: [:create, :update, :destroy]
  resources :hospitals, only: [:index, :show]
  resources :procedures, only: :show

  get '/hospitalquery', to: 'hospital#location'

  post '/login', to: 'auth#login'

  get '/me', to: 'users#me'
end
