Rails.application.routes.draw do
  get '/sign_in', to: 'sessions#new'
  get '/sign_out', to: 'sessions#destroy'
  resource :sessions
  
  get 'users/new'
  get '/register', to: 'users#new'
  resources :users
  
  root "posts#index"
  resources :posts do
    resources :comments
  end
end
