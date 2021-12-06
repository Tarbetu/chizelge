# frozen_string_literal: true

Rails.application.routes.draw do
  resources :entries
  post "entries/finish"

  devise_for :admins
  authenticated :admin do
    get 'admin_pages/dashboard'
    root "admin_pages#dashboard", as: "administration"
  end

  devise_for :users
  authenticated :user do
    root "entries#index", as: "user_index"
  end

  get 'home/index'
  root "home#index"
end
