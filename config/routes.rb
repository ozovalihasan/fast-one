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
    member do
      post :new
    end
  end

  namespace :checks do
    resources :order_items, only: [:index, :update, :destroy]
  end

  post "checkouts/create", to: "checkouts#create"
  resources :webhooks, only: [:create]

  root "categories#index"

  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server'
  get '/422', to: 'errors#unprocessable'

end
