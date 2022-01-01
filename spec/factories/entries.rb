# frozen_string_literal: true

FactoryBot.define do
  factory :entry do
    association :user, factory: :user
    comment { "Killing anyone who don't like Chinese food" }
    category { "Being an assasin of General Tso" }
    finished_at { nil }
  end
end
