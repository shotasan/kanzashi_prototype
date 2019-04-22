FactoryBot.define do
  factory :user do
    name { "MyString" }
    sequence :email do |n|
      "test#{n}@example.com"
    end
    password { "password" }
  end
end
