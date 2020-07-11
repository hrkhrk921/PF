class CounselsController < ApplicationController
  before_action :authenticate_user!, only: [:edit,:new,:create,:update,:destroy]
  def index
    @counsels = Counsel.all
  end

  def show
    @counsel = Counsel.find(params[:id])
    @counsel_comments = @counsel.counsel_comments.all
    @counsel_comment = @counsel.counsel_comments.build #投稿全体へのコメント投稿用の変数
    @counsel_comment_reply = @counsel.counsel_comments.build #コメントに対する返信用の変数
  end

  def edit
    @counsel = Counsel.find(params[:id])
  end

  def new
    @counsel = Counsel.new
  end

  def create
    @counsel = Counsel.new(counsel_params)
    @counsel.user_id = current_user.id
    if @counsel.save
      redirect_to counsel_path(@counsel)
      flash[:notice] = "投稿されました!"
    else
      render :new
    end
  end

  def update
    @counsel = Counsel.find(params[:id])
    if @counsel.update(counsel_params)
      redirect_to counsel_path(@counsel)
      flash[:notice] = "更新されました!"
    else
      render :edit
    end
  end

  def destroy
    @counsel = Counsel.find(params[:id])
    @counsel.destroy
    redirect_to counsels_url
  end

  private
  def counsel_params
    params.require(:counsel).permit(:title, :body, :image, :is_settled)
  end
end

