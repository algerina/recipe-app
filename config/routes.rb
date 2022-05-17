Rails.application.routes.draw do
  devise_for :users
  resources :foods, only: %i[index]
  root "foods#index"
end
