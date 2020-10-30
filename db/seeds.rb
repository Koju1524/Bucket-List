# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Article.create(
    user_id: 2,
    title: Faker::Lorem.sentence(word_count: 5),
    reason: Faker::Lorem.sentence(word_count: 20),
    necessary_stuff: Faker::Lorem.sentence(word_count: 10),
    expiration: Faker::Date.forward(days: 23),
    achievement_flag: Faker::Number.decimal_part(digits: 1)
  )
end