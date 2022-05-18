Rails.application.routes.draw do
  root to: 'recipes#index'
  devise_for :users 
  
  resources :foods
  resources :recipes
  resources :public_recipes, only: %i[index]
  
  # root "foods#index"
end
