FactoryBot.define do
  factory :taste do
    impression { "MyText" }
    bitter { 1 }
    acidity { 1 }
    rich { 1 }
    sweet { 1 }
    aroma { 1 }
    bean
  end
end
