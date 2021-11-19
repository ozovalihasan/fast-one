Rails.application.routes.draw do
  devise_for :sellers
  devise_for :consumers
  devise_for :admins

  resources :categories do
    resources :products, only: [:index]  
  end

  resources :order_items, only: [:create, :update, :destroy ]
  
  resources :products do 
    resources :reviews
    resources :questions
  end

  namespace :checks do
    resources :order_items, only: [:index, :update, :destroy]
  end

  root "categories#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
