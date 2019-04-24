FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user
    my_blend
  end
end
