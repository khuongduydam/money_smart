Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :output_moneys
  resources :input_moneys
  resources :daily_cashes
  resources :products
  resources :categories

  root 'daily_cashes#index'
end
