require 'rails_helper'

RSpec.describe 'comment', type: :system do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, achievement_flag: 'Achievement', user: user) }
  let!(:achieved_article) { create(:achieved_article, article: article, user: user) }
  let!(:comments) { create_list(:comment, 3, achieved_article: achieved_article, article: article, user: user) }
  # It's need dami images

  it 'comments-show' do
    visit article_achieved_article_path(article_id: article.id, id: achieved_article.id)

    comments.each do |comment|
      expect(page).to have_css('.comment_content ', text: comment.content)
    end
  end

end