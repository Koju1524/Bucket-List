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
class AchievedArticle < ApplicationRecord

  belongs_to :user
  belongs_to :article

  has_rich_text :advice

  has_many_attached :images
  has_many :comments
  has_many :thumbs_ups
  
  default_scope -> { order(created_at: :desc) }

  def display_created_at
    I18n.l(self.created_at, format: :long)
  end

end
