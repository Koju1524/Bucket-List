# == Schema Information
#
# Table name: comments
#
#  id                  :integer          not null, primary key
#  content             :text             not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  achieved_article_id :integer
#  article_id          :integer          not null
#  user_id             :integer          not null
#
# Indexes
#
#  index_comments_on_achieved_article_id  (achieved_article_id)
#  index_comments_on_article_id           (article_id)
#  index_comments_on_user_id              (user_id)
#
# Foreign Keys
#
#  achieved_article_id  (achieved_article_id => achieved_articles.id)
#
class Comment < ApplicationRecord

  belongs_to :article
  belongs_to :user

  validates :content, length: { minimum: 2, maximum: 100 }

  default_scope -> { order(created_at: :desc) }

end
