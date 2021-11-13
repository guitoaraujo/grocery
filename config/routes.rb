Rails.application.routes.draw do
  devise_for :users

  root 'products#index'
  resources :products, only: %i[index]
  resources :carts, only: %i[create]
  get :cart, to: 'carts#show'
  delete :delete_products, to: 'carts#delete_products'
  patch :cart_update, to: 'carts#update'
end
