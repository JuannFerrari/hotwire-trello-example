Rails.application.routes.draw do
  resources :cards
  root to: 'boards#index'
  resources :boards do
    resources :columns, only: [:edit, :create, :update, :destroy] do
      resources :cards, only: [:edit, :create, :update, :destroy]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
