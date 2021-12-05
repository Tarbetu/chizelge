# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  resources :entries
  get 'home/index'

  authenticated :admin do
    get 'admin_pages/dashboard'
    root "admin_pages#dashboard", as: "administration"
  end

  authenticated :user do
    root "entries#index", as: "user_index"
  end

  root "home#index"
end
