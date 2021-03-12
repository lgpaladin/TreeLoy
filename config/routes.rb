Rails.application.routes.draw do
  
  devise_for :users
  
  resources :lists
  resources :users
  resources :teams
  resources :tasks
  resources :sections
  resources :projects
  
  root to: 'users#show'

end
