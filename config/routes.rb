Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root "cabs#index"


  get "/cabs", to: "cabs#index"
  get "/trips", to: "trips#index"
  post "/trips/start", to: "trips#start_trip"
  put "/trips/:id/end", to: "trips#end_trip"

  get "profile", to: "profile#show"
  patch "profile/update_city", to: "profile#update_city"
end
