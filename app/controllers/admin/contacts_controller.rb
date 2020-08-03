class Admin::ContactsController < ApplicationController
  def index
	if params[:order_views] == "admin/home"
		@contacts = Contact.where(created_at: 0.day.ago.all_day)
	else
	    @contacts = Contact.all
    end
  end

  def show
  	@contact = Contact.find(params[:id])
  end
end
