# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products
  resources :users, only: %i[index]
  resources :orders
end
