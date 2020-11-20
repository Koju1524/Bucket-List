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
require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
