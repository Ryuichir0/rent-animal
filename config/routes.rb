Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :herds do
    resources :bookings
  end
  # get "/dashboard", to: "herds#index", as: :herds
  #get "/herds/new", to: "herds#new", as: :new_herd
  #get "/herds/:id", to: "herds#show", as: :herd
  #post "/dashboard", to: "herds#create"
  #get "/herds/:id/edit", to: "herds#edit", as: :edit_herd
  #patch "/herds/:id", to: "herds#update"
  #delete "herds/:id", to: "herds#destroy"
#
# get "/bookings", to: "bookings#index", as: :bookings
  #get "/bookings/:id", to: "bookings#show", as: :booking
  #get "/herds/:id/bookings/new", to: "bookings#new", as: :new_booking
  #post "/herds/:id/bookings", to: "bookings#create"
  #get "/bookings/:id/edit", to: "bookings#edit", as: :edit_booking
  #patch "/bookings/:id", to: "bookings#update"
  #delete "bookings/:id", to: "bookings#destroy"
  #r details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
