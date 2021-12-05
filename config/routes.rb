# frozen_string_literal: true

Rails.application.routes.draw do
  resources :entries
  devise_for :users
  get 'home/index'

  # if user_signed_in?
  #   root "entry#index"
  # else
  root "home#index"
  # end
end
