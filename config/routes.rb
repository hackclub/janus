Rails.application.routes.draw do
  get "up" => "rails/health#show", :as => :rails_health_check # returns 200 if the app boots with no exceptions, otherwise 500

  namespace :my do
    resources :sessions, only: %i[new destroy]
  end

  root to: "occurrences#index"
end
