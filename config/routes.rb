Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :bars do
    resources :events, only: [:new, :create, :edit, :update] do
      member do
        patch :accept
        patch :decline
      end
    end
  end
  resources :events, only: [:destroy]
  get "my-own-events", to: "events#my_own_events"
  get 'mybars', to: 'bars#mybars'
end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
