# == Schema Information
#
# Table name: thumbs_ups
#
#  id                  :integer          not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  achieved_article_id :integer          not null
#  article_id          :integer
#  user_id             :integer          not null
#
# Indexes
#
#  index_thumbs_ups_on_achieved_article_id  (achieved_article_id)
#  index_thumbs_ups_on_article_id           (article_id)
#  index_thumbs_ups_on_user_id              (user_id)
#
require 'rails_helper'

RSpec.describe ThumbsUp, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
