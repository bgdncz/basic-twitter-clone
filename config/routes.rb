Rails.application.routes.draw do
  resources :tweets, only: [:index, :show, :new, :create]
  resources :users
  post "/users/:id/follow", to: "users#follow", as: "follow_user"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
