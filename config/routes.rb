Rails.application.routes.draw do
  get 'recipies/index'
  get 'recipies/show'
  get 'recipies/create'
  devise_for :users
  root to: 'home#index'
end
