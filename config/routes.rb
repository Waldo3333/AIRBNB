Rails.application.routes.draw do
  root "flats#index"
  get 'dashboards/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :flats, only: [:new, :show ,:create, :edit, :update, :destroy, :index] do
    resources :bookings
  end
  resources :dashboards, only: [:index]
  # Defines the root path route ("/")

end
