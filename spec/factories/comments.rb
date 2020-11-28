# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#  index_comments_on_user_id     (user_id)
#
FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.characters(number: 20) }
  end
end