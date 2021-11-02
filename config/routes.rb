Rails.application.routes.draw do
  devise_for :users
  resources :products,include: [:index, :show ]
  root "products#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
