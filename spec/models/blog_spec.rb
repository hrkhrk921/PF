require 'rails_helper'

RSpec.describe Blog, "モデルに関するテスト", type: :model do
 context "データが正しく保存される" do
      before do
          @blog = Blog.new
          @blog.title = "Hello WebCamp"
          @blog.body = "今日も晴れです。"
          @blog.user_id = "1"
          @blog.category_id = "1"
          @blog.image_id = "1"
          @blog.save
      end
      it "全て入力してあるので保存される" do
          expect(@blog).to be_valid
      end
  end
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:blog) { build(:blog, user_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        blog.title = ''
        expect(blog.valid?).to eq false;
      end
    end
    context 'bodyカラム' do
      it '空欄でないこと' do
        blog.body = ''
        expect(blog.valid?).to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Blog.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
