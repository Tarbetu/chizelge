# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "ninja#{n}@example.com"
  end

  factory :user do
    email
    password { "qwerty" }
    role { "admin" }
  end
end
