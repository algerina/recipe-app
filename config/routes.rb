Rails.application.routes.draw do
  root to: 'foods#index'
  devise_for :users 
  
  resources :foods
  resources :recipes
  resources :public_recipes, only: %i[index]
end
