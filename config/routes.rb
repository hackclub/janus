Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up", to: "rails/health#show", as: :rails_health_check

  get "sign_in", to: "users/sign_ins#new"
  get "sign_out", to: "users/sign_outs#new"

  scope path: "my", module: :users do
    resources :sessions, only: [:new, :destroy]
  end

  resource :calendar, only: [:show]

  root to: "bookings#index"
  resources :bookings, only: [:show, :edit, :update] do
    resources :approvals, only: [:new, :create], module: :bookings
    resources :rejections, only: [:create], module: :bookings
  end
  namespace :bookings do
    resources :requests, only: [:index, :new, :create]
  end
end
