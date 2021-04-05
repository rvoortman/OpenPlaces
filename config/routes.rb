# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "category#index"

  devise_for :users, controllers: {
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  mount Api => '/api'

  resources :category
end
