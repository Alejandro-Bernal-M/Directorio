Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :directors, only: [:show, :index, :create, :destroy, :new]
  resources :groups

  resources :superusers

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
  resources :assignations, only: [:destroy]
  resources :groups_users, only: [:create, :destroy]
  resources :plans

  get "*path", to: "home#index"
end
