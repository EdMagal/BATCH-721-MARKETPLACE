Rails.application.routes.draw do
  root to: 'pages#home'
  resources :products, only: [ :index, :show, :new, :create, :destroy ]
  resources :deals, only: [:new, :create, :show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
