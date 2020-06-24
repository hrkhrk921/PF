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
      flash[:notice] = "投稿されました!"
    else
      @blogs = Blog.all
      render 'index'
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blog_path(@blog)
      flash[:notice] = "更新されました!"
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_url
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :body, :image, :category_id)
  end
end
