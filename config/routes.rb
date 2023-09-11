Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :directors, only: [:show, :index] do
    resources :groups
  end

  resources :users, only: [:show, :create, :update, :delete]
  resources  :professions
  resources :jobs
  resources :jobplaces

end
