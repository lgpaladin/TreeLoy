Rails.application.routes.draw do
  
  devise_for :users
  
  resources :projects do
    resources :lists do
      resources :tasks do
      end
    end
  end

  resources :users
  resources :teams  
  resources :sections
  
  
  root to: 'users#show'

end
