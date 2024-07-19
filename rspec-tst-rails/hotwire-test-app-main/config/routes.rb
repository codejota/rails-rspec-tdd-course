# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'

  resources :courses

  resources :users do
    member do
      post :change_status
    end
  end

  resources :user_courses, only: [:index] do
    member do
      post :like
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'welcome#index'
end
