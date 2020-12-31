# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  user_name              :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_user_name             (user_name) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  has_many :achieved_articles, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :thumbs_ups, dependent: :destroy
  has_many :favorite_achieved_articles, through: :thumbs_ups, source: :achieved_article
  has_one :profile, dependent: :destroy

  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :followings, through: :following_relationships, source: :following

  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower

  delegate :location, :birthday, to: :profile, allow_nil: true

  validates_uniqueness_of :user_name
  validates_presence_of :user_name

  def has_written?(article)
    articles.exists?(id: article.id)
  end

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'bucket.png'
    end
  end

  def has_thumbs_up(achieved_article)
    thumbs_ups.exists?(achieved_article_id: achieved_article.id)
  end

  def has_written?(achieved_article)
    achieved_articles.exists?(id: achieved_article.id)
  end

  def has_liked?(article)
    likes.exists?(article_id: article.id)
  end

  def follow!(user)
    user_id = get_user_id(user)
    following_relationships.create!(following_id: user_id)
  end

  def unfollow!(user)
    user_id = get_user_id(user)
    relationship = following_relationships.find_by!(following_id: user_id)
    relationship.destroy!
  end

  def has_followed?(user)
    following_relationships.exists?(following_id: user.id)
  end

  def prepare_profile
    profile || build_profile
  end

  private
  def get_user_id(user)
    if user.is_a?(User)
      user.id
    else
      user
    end
  end
end
