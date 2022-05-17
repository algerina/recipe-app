Rails.application.routes.draw do
  resources :recipes
  # get 'recipes/index'
  # get 'recipes/show'
  # get 'recipes/create'
  devise_for :users
  root to: 'recipes#index'
end
