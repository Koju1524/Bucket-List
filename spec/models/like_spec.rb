require 'rails_helper'

RSpec.describe Like, type: :model do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, user: user) }
  let!(:like) { build(:like, article: article, user: user) }

  context 'about like' do
    it 'can like' do
      expect(like).to be_valid
    end
  end

end
