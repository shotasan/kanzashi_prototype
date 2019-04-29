FactoryBot.define do
  factory :my_blend do
    name { "MyString" }
    choice1 { 1 }
    choice2 { 1 }
    choice3 { 1 }
    amount1 { 1 }
    amount2 { 1 }
    amount3 { 1 }
    description { "MyText" }
    user
  end
end
