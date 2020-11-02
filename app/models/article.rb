# == Schema Information
#
# Table name: articles
#
#  id               :integer          not null, primary key
#  achievement_flag :integer          not null
#  expiration       :date             not null
#  necessary_stuff  :text             not null
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

  validates :title, presence: true
  validates :title, length: { minimum: 2, maximum: 100 }

  validates :reason, presence: true
  validates :reason, length: { minimum: 2, maximum: 150 }

  validates :necessary_stuff, presence: true
  validates :necessary_stuff, length: { minimum: 2, maximum: 150 }

  validates :expiration, presence: true

  has_one_attached :picture

  belongs_to :user

end
