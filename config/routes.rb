Rails.application.routes.draw do

  namespace :admin do
      resources :users
      resources :carts
      resources :items
      resources :item_carts
      resources :item_orders
      resources :orders

      root to: "users#index"
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'items#index'

  devise_for :users

  resources :items, only: [:show, :create, :index]
  resources :orders, except: [:new, :edit, :update]
  resources :carts, except: [:new, :edit, :index]
  resources :item_carts, only: [:destroy]

  resources :static_pages, only: [:index]



end
