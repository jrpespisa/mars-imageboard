Rails.application.routes.draw do
  root "rovers#index"
  resources :rovers do
    resources :images, only: [:show]
  end
end
