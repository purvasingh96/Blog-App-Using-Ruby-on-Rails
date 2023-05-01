Rails.application.routes.draw do
  root "posts#index"
  # get "/posts", to: "posts#index"
  # get "/posts/:id", to: "posts#show"
  resources :posts do
    resources :comments
  end
end
