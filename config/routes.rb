Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :directors, only: [:show, :index] do
    resources :groups
  end

  resources :users, only: [:show, :create, :update, :delete] do
    resources :user_jobs, only: [:new, :create]
  end
  resources  :professions
  resources :jobs
  resources :jobplaces
  resources :requests

end
