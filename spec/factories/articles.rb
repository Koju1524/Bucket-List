# == Schema Information
#
# Table name: articles
#
#  id               :integer          not null, primary key
#  achieved_day     :date
#  achievement_flag :integer          not null
#  advice           :text
#  expiration       :date             not null
#  feeling          :text
#  necessary_stuff  :text
#  reason           :text             not null
#  title            :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer          not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
FactoryBot.define do
  factory :article do
    title { Faker::Lorem.characters(number: 10) }
    reason {Faker::Lorem.characters(number: 30) }
    necessary_stuff { Faker::Lorem.characters(number: 30) } 
    expiration { Faker::Date.forward(days: 300) }
    achievement_flag { Faker::Number.between(from: 0, to: 1)} 
  end
end
