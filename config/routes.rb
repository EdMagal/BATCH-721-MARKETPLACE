Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "user/:id/list_cart", to: "deals#list_cart", as: "list_cart"
  get "user/:id/list_hist", to: "deals#list_hist", as: "list_hist"
  get "user/:id/list_finish", to: "deals#list_finish", as: "list_finish"

  resources :products, only: [ :index, :show, :new, :create, :destroy, :update ] do
    resources :deals, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    collection do
      get :cheap
    end
  end
  resources :deals, only: [:destroy ]
end
