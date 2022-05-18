Rails.application.routes.draw do
  root to: 'recipes#index'
  devise_for :users 
  
  resources :foods
  resources :recipes
  
  # root "foods#index"
end
