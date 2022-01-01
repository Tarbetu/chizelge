# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id { 1 }
    email { "ninja@example.com" }
    password { "qwerty" }
    role { "admin" }
  end

  factory :factoryuser do
    id { 2 }
    email { "i_was_a_girl@now_im_a_bot.com" }
    password { "notagirl" }
  end
end
