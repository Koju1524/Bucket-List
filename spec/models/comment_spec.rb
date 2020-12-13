# == Schema Information
#
# Table name: comments
#
#  id                  :integer          not null, primary key
#  content             :text             not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  achieved_article_id :integer
#  article_id          :integer          not null
#  user_id             :integer          not null
#
# Indexes
#
#  index_comments_on_achieved_article_id  (achieved_article_id)
#  index_comments_on_article_id           (article_id)
#  index_comments_on_user_id              (user_id)
#
# Foreign Keys
#
#  achieved_article_id  (achieved_article_id => achieved_articles.id)
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, achievement_flag: 'Achievement', user: user) }
  let!(:achieved_article) { build(:achieved_article, article: article, user: user) }

  describe '#create' do
    before do
      @achieved_article = FactoryBot.build(:achieved_article)
      @achieved_article.images = fixture_file_upload('app/assets/images/beach.jpg')
      @achieved_article.create
    end
  end

  context 'contentが入力されている場合' do

    let!(:comment) { build(:comment, user: user, article: article, achieved_article: achieved_article) }

      it 'commentがsaveできる' do
        expect(comment).to be_valid
      end
    end

  context 'contentの文字がー文字の場合' do
    let!(:comment) { build(:comment, content: Faker::Lorem.characters(number: 1), user: user, article: article, achieved_article: achieved_article) }

    before do
      comment.save
    end

    it 'commentをsaveできない' do
      expect(comment.errors.messages[:content][0]). to eq('is too short (minimum is 2 characters)')
    end

  end

end
