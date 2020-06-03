Rails.application.routes.draw do
  root to: 'users#index'

  

  devise_for :users

  resources :images do 
    resources :comments
  end
end