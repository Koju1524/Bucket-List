require 'rails_helper'

RSpec.describe 'AchievedArticles', type: :request do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, achievement_flag: 'Achievement', user: user) }
  let!(:achieved_article) { create_list(:achieved_article, 1, article: article, user: user) }

  describe 'POST/achieved_articles' do
    context 'already login' do

      before do
        sign_in user
      end

      it 'achieved_article save' do
        achieved_article_params = attributes_for(:achieved_article)
        achieved_article_params[:user_id] = user.id
        achieved_article_params[:article_id] = article.id
        put article_achieved_article_path(article_id: article.id, id: achieved_article, achieved_article: achieved_article_params)
        expect(response).to have_http_status(302)
        expect(AchievedArticle.first.title).to eq(achieved_article_params[:title])
        expect(AchievedArticle.first.impression).to eq(achieved_article_params[:impression])
        expect(AchievedArticle.first.advice.body.to_plain_text).to eq(achieved_article_params[:advice])
        expect(AchievedArticle.first.achieved_day).to eq(achieved_article_params[:achieved_day])
        expect(AchievedArticle.first.images.attach).to eq(achieved_article_params[:images])
      end
    end

  end

end
