Rails.application.routes.draw do
  devise_for :sellers, controllers: {
    sessions: 'sessions',
    registrations: 'registrations',
  }

  devise_for :consumers, controllers: {
    sessions: 'sessions',
    registrations: 'registrations',
  }
  
  devise_for :admins, controllers: {
    sessions: 'sessions',
    registrations: 'admins/registrations',
  }

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
