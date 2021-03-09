Rails.application.routes.draw do

  resources :lists
  resources :project
  resources :user
  resources :team
  resources :section

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'lists#index'

end
