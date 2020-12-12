# == Schema Information
#
# Table name: achieved_articles
#
#  id           :integer          not null, primary key
#  achieved_day :date
#  advice       :text
#  impression   :text
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  article_id   :integer          not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_achieved_articles_on_article_id  (article_id)
#  index_achieved_articles_on_user_id     (user_id)
#
FactoryBot.define do
  factory :achieved_article do
    title { Faker::Lorem.characters(number: 10) }
    impression {Faker::Lorem.characters(number: 30) }
    advice { Faker::Lorem.characters(number: 30) }
    achieved_day { Faker::Date.forward(days: 300) }
  end
end
