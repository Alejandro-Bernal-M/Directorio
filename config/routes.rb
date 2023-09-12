Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :directors, only: [:show, :index] do
    resources :groups
  end

  resources :users, only: [:show, :create, :update, :destroy] do
    resources :jobs_users, only: [:new, :create, :destroy] do
      resources :responsibilities, only: [:index, :create, :update, :destroy ]
    end
  end
  resources  :professions
  resources :jobs 
  resources :jobplaces
  resources :requests

end
