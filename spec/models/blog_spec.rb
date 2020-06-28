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
end
