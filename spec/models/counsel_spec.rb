require 'rails_helper'

RSpec.describe Counsel, type: :model do
  context "データが正しく保存される" do
    before do
      @counsel = Counsel.new
      @counsel.title = "Hello WebCamp"
      @counsel.body = "今日も晴れです。"
      @counsel.user_id = "1"
      @counsel.image_id = "1"
      @counsel.save
    end
    it "全て入力してあるので保存される" do
      expect(@counsel).to be_valid
    end
  end
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:counsel) { build(:counsel, user_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        counsel.title = ''
        expect(counsel.valid?).to eq false;
      end
    end
    context 'bodyカラム' do
      it '空欄でないこと' do
        counsel.body = ''
        expect(counsel.valid?).to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Counsel.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
