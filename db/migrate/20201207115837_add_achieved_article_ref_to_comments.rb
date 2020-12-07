class AddAchievedArticleRefToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :achieved_article, foreign_key: true
  end
end
