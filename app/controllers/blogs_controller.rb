class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
    @categories = Category.all
  end

  def new
    @blog = Blog.new
    @categories = Category.all
  end

  def create
    @blog = Blog.new(blog_params)
    @categories = Category.all
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to @blog
    else
      @blogs = Blog.all
      render 'index'
    end
  end

  def update
    
  end

  def destroy
    
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :body, :image, :category_id)
  end
end
