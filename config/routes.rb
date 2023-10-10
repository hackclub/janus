Rails.application.routes.draw do
  get "up", to: "rails/health#show", as: :rails_health_check # returns 500 if the app boots with exceptions

  get "sign_in", to: "users/sign_ins#new"
  get "sign_out", to: "users/sign_outs#new"

  scope path: "my", module: :users do
    resources :sessions, only: [:new, :destroy]
  end

  concern :commentable do |options|
    resources :comments, shallow: true, except: :index, **options
  end

  resource :calendar, only: :show

  root to: "bookings#index"

  resources :events, only: :show

  namespace :bookings do
    resources :requests, only: [:index, :new, :create]
  end
  resources :bookings, only: [:show, :edit, :update] do
    scope module: :bookings do
      resource :timeline, only: :show

      resources :approvals, only: :create
      resources :rejections, only: :create
    end

    concerns :commentable
  end
end
