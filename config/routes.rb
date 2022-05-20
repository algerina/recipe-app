Rails.application.routes.draw do
  root to: 'foods#index'
  devise_for :users

  devise_scope :user do  
     get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  
  resources :foods
  resources :recipes do
    resources :recipe_foods
    resources :shopping_list, only: %i[index]
  end
  resources :public_recipes, only: %i[index]
end
