class Admin::HomeController < ApplicationController
  before_action :authenticate_admin!
  def top #今日の日付取得
	@contacts = Contact.where(created_at: 0.day.ago.all_day)
  end
end
