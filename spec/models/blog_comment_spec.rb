require 'rails_helper'

RSpec.describe BlogComment, type: :model do
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

  describe '投稿詳細画面' do
    context "ログインしているユーザーが投稿者以外の場合" do
      it 'コメントを投稿できること' do
        fill_in('comment_content', with: 'chiba')
        click_on 'コメントする'
        expect(page).to have_content 'chiba'
      end
      it '自分のコメントを編集できること' do
        fill_in('comment_content', with: 'chiba')
        click_on 'コメントする'
        click_link '編集'
        fill_in('edit_comment', with: 'chibachiba')
        click_on '編集する'
        expect(page).to have_content 'chibachiba'
      end
      it '自分のコメントを削除できること' do
        fill_in('comment_content', with: 'chiba')
        click_on 'コメントする'
        click_link '削除'
        expect(page).to have_no_content 'chiba'
      end
    end
    context "ユーザーがログアウトしている場合" do
      it 'コメントを投稿できないこと' do
        click_link 'Logout'
        click_link 'Strolls'
        click_link ('記事を読む'), match: :first
        expect(page).to have_no_button 'コメントする'
      end
    end
  end
end
end
