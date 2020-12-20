require 'rails_helper'

RSpec.describe 'achieved_article', type: :system do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, achievement_flag: 'Achievement', user: user) }
  let!(:achieved_articles) { create_list(:achieved_article, 3, article: article, user: user) }
  before do
    @achieved_article = build(:achieved_article)
    @achieved_article.images= fixture_file_upload('app/assets/images/beach.jpg')
  end

  it 'achieved_articles-index' do
    visit article_achieved_articles_path(article_id: article.id)

    achieved_articles.each do |achieved_article|
      expect(page).to have_css('.bucket_list', text: achieved_article.title)
    end
  end

  # it 'achieved_article-show' do
  #   visit article_achieved_articles_path(article_id: article.id)

  #   achieved_article = achieved_articles.first
  #   click_on achieved_articles.first.title

  #   expect(page).to have_css('.user_name', text: achieved_article.user.user_name)
  #   expect(page).to have_css('.content', text: achieved_article.title)
  #   expect(page).to have_css('.content', text: achieved_article.impression)
  #   expect(page).to have_css('.content', text: achieved_article.advice.to_plain_text)
  #   expect(page).to have_css('.content', text: achieved_article.achieved_day)
  # end

end