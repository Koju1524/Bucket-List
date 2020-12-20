require 'rails_helper'

RSpec.describe 'Profile', type: :system do
  let!(:user) { create(:user, :with_profile) }

  context 'already login' do

    before do
      sign_in user
    end

    it 'Make sure my profike' do
      visit profile_path
      expect(page).to have_css('.profilePage_user_name', text: user.user_name)
      expect(page).to have_css('.birthday', text: user.birthday)
      expect(page).to have_css('.location', text: user.location)
      expect(page).to have_css('.profilePage_user_bio', text: user.profile.bio)
    end
  end

end