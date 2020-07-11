class HomeController < ApplicationController
  def top
  	@blogs = Blog.order(created_at: :desc).limit(4)
  	@photos = Photo.order(created_at: :desc).limit(3)
  end

  def about
  end
end
