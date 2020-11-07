module ArticleDecorator

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