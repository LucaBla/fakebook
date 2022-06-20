Rails.application.routes.draw do
  resources :posts
  resources :friend_requests do
    member do
      post 'accept'
      post 'destroy'
    end
  end
  resources :likes
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'posts#index'
end
