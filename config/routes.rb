Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products, only: [ :index, :show, :new, :create, :destroy ] do
    resources :deals, only: [:new, :create, :show, :destroy] 
     # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    collection do
      get :cheap
    end
  end
end
