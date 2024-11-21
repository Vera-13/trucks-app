Rails.application.routes.draw do
  root to: "pages#home"
  get "about", to: "pages#about"
  get "aftertreatment", to: "pages#aftertreatment"
  get "blog", to: "pages#blog"
  get "diagnostic", to: "pages#diagnostic"
  get "fleet_services", to: "pages#fleet_services"
  get "maintenance", to: "pages#maintenance"
  get "roadside_assistance", to: "pages#roadside_assistance"
  get "services", to: "pages#services"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
