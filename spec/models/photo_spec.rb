require 'rails_helper'

RSpec.describe Photo,"モデルに関するテスト",type: :model do
  context "データが正しく保存される" do
    before do
      @photo = Photo.new
      @photo.title = "Hello WebCamp"
      @phto.body = "今日も晴れです。"
      @photo.user_id = "1"
      @photo.image_id = "1"
      @photo.save
    end
    it "全て入力してあるので保存される" do
      expect(@photo).to be_valid
    end
  end
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:photo) { build(:photo, user_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        photo.title = ''
        expect(photo.valid?).to eq false;
      end
    end
    context 'bodyカラム' do
      it '空欄でないこと' do
        photo.body = ''
        expect(photo.valid?).to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Photo.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
