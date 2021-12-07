# frozen_string_literal: true

Rails.application.routes.draw do
  resources :entries
  post "entries/finish"

  devise_for :users
  authenticated :user do
    root "entries#index", as: "user_index"
  end

  namespace :admin_pages do
    get "dashboard", as: "panel"
    get "result", to: "admin_pages#result"
    post "result", to: "admin_pages#search"
  end
  
  get 'home/index'
  root "home#index"
end
