Rails.application.routes.draw do
  devise_for :users
  resources :foods
  root "home#index"
end
