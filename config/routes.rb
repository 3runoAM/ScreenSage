Rails.application.routes.draw do
  root "home#index"
  resources :movies, only: [:show, :new, :create, :edit, :update]
  resources :directors, only: [:index, :show, :new, :create, :edit, :update]
  resources :genres, only: [:index, :show, :new, :create, :edit, :update]
end
