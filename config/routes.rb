# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins

  resources :entries
  get 'home/index'

  authenticated :admin do
    get 'admin_pages/dashboard'
    root "admin_pages#dashboard", as: "administration"
  end

  # if user_signed_in?
  #   root "entry#index"
  # else
  root "home#index"
  # end
end
