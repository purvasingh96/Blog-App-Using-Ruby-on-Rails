Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  root "posts#index"
  # get "/posts", to: "posts#index"
  # get "/posts/:id", to: "posts#show"
  resources :posts do
    resources :comments
  end
end
