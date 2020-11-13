# == Schema Information
#
# Table name: articles
#
#  id               :integer          not null, primary key
#  achievement_flag :integer          not null
#  expiration       :date             not null
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
