Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up", to: "rails/health#show", as: :rails_health_check

  get "sign_in", to: "users/sign_ins#new"

  scope path: "my", module: :users do
    resource :session, only: [:new, :destroy]
  end

  root to: "bookings#index"
end
