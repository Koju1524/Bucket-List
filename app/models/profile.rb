# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  bio        :text
#  birthday   :date
#  location   :string
#  subscribed :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
class Profile < ApplicationRecord

  belongs_to :user

  has_one_attached :avatar

  validates :location, presence: true
  validates :location, length: { minimum: 2, maximum: 20}

end
