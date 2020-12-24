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
class Article < ApplicationRecord

  enum achievement_flag: { Unachievement: 0, Achievement: 1 }
  has_rich_text :necessary_stuff

  validates :title, presence: true
  validates :reason, presence: true
  validates :necessary_stuff, presence: true
  validates :expiration, presence: true

  has_many :likes, dependent: :destroy
  has_one :achieved_article, dependent: :destroy

  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  def display_created_at
    I18n.l(self.created_at, format: :long)
  end

  def author_name
    user.user_name
  end

  def like_count
    likes.count
  end
  
end
