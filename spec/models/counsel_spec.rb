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
end
