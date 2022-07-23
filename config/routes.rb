Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :plants do
    resources :bookings, only: [ :index, :show, :new, :create ]
  end
  resources :bookings, only: [:destroy]
  get "my-bookings", to: "bookings#my_bookings"
end
