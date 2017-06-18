Rails.application.routes.draw do
  devise_for :users, skip: :registrations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :output_moneys
  resources :input_moneys do
    collection do
      get :edit_in_js
    end
  end
  resources :daily_cashes do
    collection do
      get :edit_out_js
      get :total_money_inday_js
      get :money_with_month_js
    end
  end
  resources :products
  resources :categories

  root 'daily_cashes#index'
end
