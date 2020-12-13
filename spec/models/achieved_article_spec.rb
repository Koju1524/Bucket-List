# == Schema Information
#
# Table name: achieved_articles
#
#  id           :integer          not null, primary key
#  achieved_day :date
#  advice       :text
#  impression   :text
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  article_id   :integer          not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_achieved_articles_on_article_id  (article_id)
#  index_achieved_articles_on_user_id     (user_id)
#
require 'rails_helper'

RSpec.describe AchievedArticle, type: :model do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, achievement_flag: 'Achievement', user: user) }

  context 'title,impression,advice,achieved_day,imagesが入力されている場合' do
    let!(:achieved_article) { build(:achieved_article, article: article, user: user) }
    describe '#create' do
      before do
        @achieved_article = FactoryBot.build(:achieved_article)
        @achieved_article.images = fixture_file_upload('app/assets/images/beach.jpg')
        @achieved_article.save
      end
    end

    it 'achieved_articleが保存できる' do
      expect(achieved_article).to be_valid
    end
  end

  context 'title,impression,advice,achieved_dayが入力されている場合' do
    let!(:achieved_article) { build(:achieved_article, article: article, user: user) }

    it 'achieved_articleが保存できる' do
      expect(achieved_article).to be_valid
    end
    
  end


end
