Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :bars, only: [:index, :show, :new, :create, :edit, :update] do
    resources :events, only: [:index, :show, :new, :create, :edit, :update]
    end
    resources :events, only: [:destroy]
end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
