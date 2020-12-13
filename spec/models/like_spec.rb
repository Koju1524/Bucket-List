require 'rails_helper'

RSpec.describe Like, type: :model do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, user: user) }

  context 'articleがある場合' do

    like = article.likes.create(user: user, article: article)

    it 'likeできる' do
      expect(like).to be_valid
    end

  end

end
