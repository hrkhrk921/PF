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
end
