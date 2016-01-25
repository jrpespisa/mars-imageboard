Rails.application.routes.draw do
  devise_for :users
  root "rovers#index"
  resources :rovers do
    resources :images, only: [:show]
  end
  resources :images do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
    resources :votes, only: [:create]
  end
end
