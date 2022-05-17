Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/create'
  devise_for :users
  root to: 'home#index'
end
