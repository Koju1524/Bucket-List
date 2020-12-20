# frozen_string_literal: true

module UserDecorator

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'hot.jpg'
    end
  end

  def has_thumbs_up(achieved_article)
    thumbs_ups.exists?(achieved_article_id: achieved_article.id)
  end

end
