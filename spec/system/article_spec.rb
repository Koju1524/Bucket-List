require 'rails_helper'

RSpec.describe 'Article', type: :system do
  let!(:user) { create(:user) }
  let!(:articles) { create_list(:article, 3, achievement_flag: 'Unachievement', user: user) }

  it 'articles-index' do
    visit root_path
    articles.each do |article|
      expect(page).to have_css('.bucket_list', text: article.title)
    end
  end

  it 'article-show' do
    visit root_path

    article = articles.first
    click_on articles.first.title

    expect(page).to have_css('.user_name', text: article.user.user_name)
    expect(page).to have_css('.content', text: article.title)
    expect(page).to have_css('.content', text: article.reason)
    expect(page).to have_css('.content', text: article.necessary_stuff.to_plain_text)
    expect(page).to have_css('.content', text: article.expiration)
  end

end