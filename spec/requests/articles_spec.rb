require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  let!(:user) { create(:user) }
  let!(:articles) { create_list(:article, 5, achievement_flag: 'Unachievement',  user: user) }

  describe 'GET /articles' do
    it '200 status return' do
      get articles_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST/articles' do
    context 'already login' do
      before do
        sign_in user
      end
      it 'article save' do
        article_params = attributes_for(:article)
        article_params[:user_id] = user.id
        post articles_path({article: article_params})
        expect(response).to have_http_status(302)
        expect(Article.first.title).to eq(article_params[:title])
        expect(Article.first.reason).to eq(article_params[:reason])
        expect(Article.first.necessary_stuff.body.to_plain_text).to eq(article_params[:necessary_stuff])
        expect(Article.first.expiration).to eq(article_params[:expiration])
        expect(Article.first.achievement_flag).to eq(article_params[:achievement_flag])
      end
    end

      context 'Not login' do
        it 'article not save' do
          article_params = attributes_for(:article)
          article_params[:user_id] = user.id
          post articles_path({article: article_params})
          expect(response).to redirect_to(new_user_session_path)
        end
      end
  end

end
