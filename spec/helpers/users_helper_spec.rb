require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  it "名前とメールアドレスとパスワードがあれば登録できる"

  it "名前がなければ登録できない"

  it "メールアドレスがなければ登録できない"

  it "メールアドレスが重複していたら登録できない"

  it "パスワードがなければ登録できない"

  it "パスワードが暗号化されているか"
end
