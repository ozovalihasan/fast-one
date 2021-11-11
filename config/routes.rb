Rails.application.routes.draw do
  devise_for :users

  resources :categories, only: [:index, :show ]
  resources :categories do
    resources :products, only: [:index]  
  end

  resources :products do
    collection do
      post :search
    end
  end
  
  resources :products, only: [:index, :show ]

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
