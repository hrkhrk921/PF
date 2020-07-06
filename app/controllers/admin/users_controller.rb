class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.page(params[:page]).per(6).order('id DESC')
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = user.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
      flash[:notice] = "更新されました!"
    else
      render :edit
    end
  end
private
  def user_params
    params.require(:user).permit(:email,:name,:is_valid )
  end
end
