# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :categories
  resources :items

  resources :carts do
    collection do
      delete 'destroy_all'
    end
  end
  resources :orders
  resources :popular_item, only: :index
  resources :resturants
  match '*path', to: 'application#route_not_found', via: :all
end
