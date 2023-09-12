Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :directors, only: [:show] do
    resources :groups
  end

  resources :users, only: [:show, :create, :update, :destroy] do
    resources :jobs_users, only: [:new, :create, :destroy] do
      resources :responsibilities, only: [:index, :create, :update, :destroy ]
    end
    resources :professions_users, only: [:create, :destroy]
    resources :jobplaces_users, only: [:create, :destroy]
  end
  resources  :professions
  resources :jobs 
  resources :jobplaces
  resources :requests

  get "*path", to: "home#index"
end
