class BlogCommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @blog_comment = @blog.blog_comments.new(blog_comment_params)
    @blog_comment.user_id = current_user.id
    if @blog_comment.save
      redirect_back(fallback_location: root_path)
      flash[:success] = "コメントが投稿されました"
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @blog_comment = BlogComment.find(params[:blog_id])
    if @blog_comment.user != current_user
      redirect_to request.referer
    end
    @blog_comment.destroy
    redirect_to request.referer
  end

  private
  def blog_comment_params
    params.require(:blog_comment).permit(:comment)
  end
end
