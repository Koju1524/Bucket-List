# == Schema Information
#
# Table name: articles
#
#  id               :integer          not null, primary key
#  achieved_day     :date
#  achievement_flag :integer          not null
#  advice           :text
#  expiration       :date             not null
#  feeling          :text
#  necessary_stuff  :text
#  reason           :text             not null
#  title            :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer          not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:user) { create(:user) }

  context 'title,reason,necessary_stuff,expiration,achievement_flagが入力されている場合' do
    let!(:article) { build(:article, user: user) }
      

    it 'articleが保存できる' do
      expect(article).to be_valid
    end

    context 'titleの文字がー文字の場合' do
      let!(:article) { build(:article, title: Faker::Lorem.characters(number: 1) , user: user) }

      before do
        article.save
      end

      it 'articleをsaveできない' do
        expect(article.errors.messages[:title][0]). to eq('is too short (minimum is 2 characters)')
      end
    end
  end
end
