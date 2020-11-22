FactoryBot.define do
  factory :article do
    title { Faker::Lorem.characters(number: 10) }
    reason {Faker::Lorem.characters(number: 30) }
    necessary_stuff { Faker::Lorem.characters(number: 30) }
    expiration { Faker::Date.forward(days: 300) }
    achievement_flag { Faker::Number.between(from: 0, to: 1)}
  end
end
