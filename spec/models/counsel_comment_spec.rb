require 'rails_helper'

RSpec.describe CounselComment, type: :model do
	before do
    user = FactoryBot.create(:user)
    second_user = FactoryBot.create(:second_user)
    stroll = FactoryBot.create(:stroll, user: second_user)
    visit root_path
    click_link 'Login'
    fill_in('user_email', with: 'user@com')
    fill_in('user_password', with: 'password')
    click_on 'ログイン'
    click_link 'Strolls'
    click_link ('記事を読む'), match: :first
  end
end
