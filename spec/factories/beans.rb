FactoryBot.define do
  factory :bean do
    name { "MyString" }
    country { "MyString" }
    plantation { "MyString" }
    roasted { "MyString" }
    grind { "MyString" }
    icon { "MyString" }
    store { "MyString" }
    price { 1 }
    purchase_date { "2019-04-20" }
    description { "MyText" }
  end
end
