# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  name = Faker::Creature::Dog.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               )
end

10.times do |n|
  user = User.first
  name = Faker::Coffee.blend_name
  country = Faker::Food.fruits
  roasted = Faker::Creature::Cat.name
  price = 1000
  purchase_date = Faker::Time.between(DateTime.now - 1, DateTime.now)
  bean = user.beans.create!(name: name,
                            country: country,
                            plantation: country,
                            roasted: roasted,
                            price: price,
                            purchase_date: purchase_date,
                            )

  bean.create_taste!(bitter: 3,
                     acidity: 3,
                     rich: 3,
                     sweet: 3,
                     aroma: 3,
                     impression: "This is Test.",
                     )
end

10.times do |n|
  user = User.last
  name = Faker::Coffee.blend_name

  my_blend = user.my_blends.create!(name: name,
                                    choice1: 1,
                                    choice2: 2,
                                    choice3: 3,
                                    amount1: 10,
                                    amount2: 10,
                                    amount3: 10,
                                    description: "TestTest"
  )

  my_blend.create_taste!(bitter: 3,
                         acidity: 3,
                         rich: 3,
                         sweet: 3,
                         aroma: 3,
                         impression: "This is Test.",
                         )
end