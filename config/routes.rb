Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/update'
  get 'bookings/delete'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
<<<<<<< HEAD
  resources :flats, only: [:show, :index]
  resources :booking

=======
>>>>>>> dc68ec505436bec320431d4a577649b8fefbaf35

  # Defines the root path route ("/")
  # root "posts#index"

  resources :bookings
end
