FactoryBot.define do
  factory :profile do
    bio { Faker::Lorem.characters(number: 100) }
    location{ Faker::Lorem.characters(number: 10) }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end