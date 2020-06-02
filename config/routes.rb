Rails.application.routes.draw do
  root to: 'users#index'

  

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :images do 
    resources :comments
  end
end