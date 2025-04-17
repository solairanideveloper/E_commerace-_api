Rails.application.routes.draw do
  root "products#index"

  resources :users do
    resources :orders, controller: 'user_orders'
  end

  resources :products
  resources :orders, only: [:new, :create, :show, :edit, :update, :destroy]
end
