FactoryBot.define do
  factory :comment do
    user { nil }
    my_blend { nil }
    content { "MyText" }
  end
end
