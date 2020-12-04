# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#  index_comments_on_user_id     (user_id)
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, user: user) }

  context 'contentが入力されている場合' do
    let!(:comment) { build(:comment, user: user, article: article) }

      it 'commentがsaveできる' do
        expect(comment).to be_valid
      end

  context 'contentの文字がー文字の場合' do
    let!(:comment) { build(:comment, content: Faker::Lorem.characters(number: 1) , article: article, user: user) }

    before do
      comment.save
    end

    it 'commentをsaveできない' do
      expect(comment.errors.messages[:content][0]). to eq('is too short (minimum is 2 characters)')
    end
  end

  end
end
