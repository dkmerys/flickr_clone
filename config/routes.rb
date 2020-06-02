Rails.application.routes.draw do
  devise_for :users
  resources :users do 
    resources :images
  end

  resources :users do
    resources :comments
  end
end
