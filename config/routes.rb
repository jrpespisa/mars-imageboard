Rails.application.routes.draw do
  root "rovers#index"
  resources :rovers, only: [:index, :show]
end
