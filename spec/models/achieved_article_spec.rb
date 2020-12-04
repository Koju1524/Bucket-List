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
require 'rails_helper'

RSpec.describe AchievedArticle, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
