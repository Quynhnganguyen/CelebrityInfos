Rails.application.routes.draw do
  resources :celebrities

  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :celebrities

  namespace :api do
  	get 'celebrities/index'
  	post 'celebrities/show'
  	post 'celebrities/update'
  	post 'celebrities/create'
  end
end
