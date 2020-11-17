require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'title,reason,necessary_stuff,expiration,achievement_flagが入力されていれば' do
    user = User.create!({
      user_name: 'ggggg',
      email: 'test@example.com',
      password: 'password'
    })
    article = user.articles.build({
      title: Faker::Lorem.characters(number: 10),
      reason: Faker::Lorem.characters(number: 30),
      necessary_stuff: Faker::Lorem.characters(number: 30),
      expiration: Faker::Date.forward(days: 300),
      achievement_flag: Faker::Number.between(from: 0, to: 1)
    })

    expect(article).to be_valid
  end
end
