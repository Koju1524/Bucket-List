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
#  user_id      :integer          not null
#
# Indexes
#
#  index_achieved_articles_on_user_id  (user_id)
#
FactoryBot.define do
  factory :achieved_article do
    
  end
end
