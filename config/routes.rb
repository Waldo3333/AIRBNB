Rails.application.routes.draw do
  get 'dashboards/index'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :bookings
  resources :dashboards, only: [:index]
  resources :flats, only: [:new, :show ,:create, :edit, :update, :destroy, :index]

end


  # Defines the root path route ("/")
  # root "posts#index"

  # delete "flats/:id", to: "flats#destroy"clear


# pour debugger
# créer route show
# mettre action show
# créer la vue
# tester
