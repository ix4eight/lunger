Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts do
    resources :comments, only: [:new, :create]
  end
  resources :languages, only: :show 
  resources :users, only: :show
end
