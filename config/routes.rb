Rails.application.routes.draw do
  resources :posts
  resources :friend_requests do
    member do
      post 'accept'
      post 'destroy'
      post 'withdraw'
    end
  end
  resources :likes
  resources :comments
  resources :bios

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'posts#index'
end
