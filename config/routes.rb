Rails.application.routes.draw do
  root to: 'foods#index'
  devise_for :users 
  
  resources :foods
  resources :recipes do
    resources :recipe_foods
  end
  resources :public_recipes, only: %i[index]
  resources :shopping_list, only: %i[index]
end
