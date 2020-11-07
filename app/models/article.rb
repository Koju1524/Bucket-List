# == Schema Information
#
# Table name: articles
#
#  id               :integer          not null, primary key
#  achievement_flag :integer          not null
#  expiration       :date             not null
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
  validates :title, length: { minimum: 2, maximum: 100 }

  validates :reason, presence: true
  validates :reason, length: { minimum: 2, maximum: 150 }

  validates :necessary_stuff, presence: true
  
  validates :expiration, presence: true

  has_many :likes, dependent: :destroy
  has_one_attached :picture

  belongs_to :user
  
end
