# == Schema Information
#
# Table name: thumbs_ups
#
#  id                  :integer          not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  achieved_article_id :integer          not null
#  article_id          :integer
#  user_id             :integer          not null
#
# Indexes
#
#  index_thumbs_ups_on_achieved_article_id  (achieved_article_id)
#  index_thumbs_ups_on_article_id           (article_id)
#  index_thumbs_ups_on_user_id              (user_id)
#
require 'rails_helper'

RSpec.describe ThumbsUp, type: :model do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, achievement_flag: 'Achievement', user: user) }
  let!(:achieved_article) { create(:achieved_article, article: article, user: user) }
  let!(:thumbs_up) { build(:thumbs_up, achieved_article: achieved_article, article: article, user: user) }

  describe '#create' do
    before do
      @achieved_article = FactoryBot.build(:achieved_article)
      @achieved_article.images = fixture_file_upload('app/assets/images/beach.jpg')
      @achieved_article.create
    end
  end

  context 'about thumbs_up' do
    it ' can thumbs_up' do
      expect(thumbs_up).to be_valid
    end
  end

end
