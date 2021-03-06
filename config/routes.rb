# frozen_string_literal: true

Rails.application.routes.draw do
  use_doorkeeper
  root to: "categories#index"

  devise_for :users, controllers: {
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  mount Api => '/api'

  resources :categories
  resources :point_of_interest
end
