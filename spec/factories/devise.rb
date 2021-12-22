FactoryBot.define do
  factory :user do
    id { 1 }
    email { "ninja@example.com" }
    password { "qwerty" }
    role { "admin" }
  end
end
