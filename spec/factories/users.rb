FactoryBot.define do
  factory :user do
    username { "CriticalCrit" }
    email { "cr@example.com" }
    password { "sample" }
    password_confirmation { "sample" }
  end
end
