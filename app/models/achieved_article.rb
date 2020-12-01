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
class AchievedArticle < ApplicationRecord

  belongs_to :user

  # validates :impression, presence: true
  # validates :advice, presence: true
  # validates :achieved_day, presence: true

  has_rich_text :advice

  has_many_attached :pictures
  
  default_scope -> { order(created_at: :desc) }

end
