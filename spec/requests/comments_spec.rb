require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, achievement_flag: 'Achievement', user: user) }
  let!(:achieved_article) { create(:achieved_article, article: article, user: user) }
  let!(:comment) { create_list(:comment, 3, achieved_article: achieved_article, article: article, user: user) }

  describe 'GET /comments' do

    it '200 status return' do
      get article_achieved_article_path(article_id: article.id, id: achieved_article.id)
      expect(response).to have_http_status(200)
    end

  end


  # describe 'POST/articles' do
  #   context '' do

  #     before do
  #       sign_in user
  #     end

  #     it 'comment save' do
  #       comment_params =  attributes_for(:comment)
  #       comment_params[:user_id] = user.id
  #       comment_params[:article__id] = article.id
  #       comment_params[:achieved_article_id] = achieved_article.id
  #       post article_achieved_article_comments_path(article_id: article.id, achieved_article_id: achieved_article.id, comment: comment_params)
  #       expect(Comment.first.content).to eq(comment_params[:content])
  #     end

  #   end

  # end

end
