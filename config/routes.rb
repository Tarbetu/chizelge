# frozen_string_literal: true

Rails.application.routes.draw do
  resources :entries
  post "entries/finish"

  devise_for :users
  authenticated :user do
    root "entries#index", as: "user_index"
  end

  get "admin_pages/dashboard", as: "admin_panel"
  get 'home/index'
  root "home#index"
end
