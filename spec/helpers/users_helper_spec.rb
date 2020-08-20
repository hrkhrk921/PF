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
  it "名前とメールアドレスとパスワードがあれば登録できる" do 
    expect(FactoryBot.create(:user)).to be_valid
  end 

  it "名前がなければ登録できない" do 
    expect(FactoryBot.build(:user, name: "")).to_not be_valid 
  end 

  it "メールアドレスがなければ登録できない" do 
    expect(FactoryBot.build(:user, email: "")).to_not be_valid 
  end 

  it "メールアドレスが重複していたら登録できない" do 
    user1 = FactoryBot.create(:user,name: "taro", email: "taro@example.com")
    expect(FactoryBot.build(:user, name: "ziro", email: user1.email)).to_not be_valid
  end 

  it "パスワードがなければ登録できない" do 
    expect(FactoryBot.build(:user, password: "")).to_not be_valid 
  end 

  it "パスワードが暗号化されているか" do 
    user = FactoryBot.create(:user)
    expect(user.password_digest).to_not eq "password"
  end 

  it "password_confirmationとpasswordが異なる場合保存できない" do 
    expect(FactoryBot.build(:user,password:"password",password_confirmation: "passward")).to_not be_valid 
  end 


end
