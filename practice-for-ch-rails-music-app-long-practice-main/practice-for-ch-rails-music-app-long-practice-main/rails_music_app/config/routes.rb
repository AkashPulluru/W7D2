Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:create, :new, :destroy]
  resource :sessions, only: [:create, :new, :index] 
  resources :bands 
  
end
