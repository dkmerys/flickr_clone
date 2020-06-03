Rails.application.routes.draw do
  root to: 'users#index'
  
  get '/users/:id', to 'users#show'
  

  devise_for :users

  resources :images do 
    resources :comments
  end
end