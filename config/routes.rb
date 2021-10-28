Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
<<<<<<< HEAD
  resources :products, only: [ :index, :show, :new, :create, :destroy ] do
    resources :deals, only: [:new, :create, :show, :destroy] 
     # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
=======
  
  resources :products, only: [ :index, :show, :new, :create, :destroy ] do
    resources :deals, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
>>>>>>> 31efc9725b52255e169e772110c5692b59930343
    collection do
      get :cheap
    end
  end
end
