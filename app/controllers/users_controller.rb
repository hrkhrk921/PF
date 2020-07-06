class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
  end

  def emend
  	@user = current_user
  end

  def favorites
    @user = current_user
  end

  def blog
    @user = current_user
    @blogs = @user.blogs.page(params[:page]).per(8).order('id DESC')
  end
  def photo
    @user = current_user
    @photos = @user.photos.page(params[:page]).per(6).order('id DESC')
  end
  def counsel
    @user = current_user
    @counsels = @user.counsels.page(params[:page]).per(8).order('id DESC')
  end

  def update
  	@user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "emend"
    end
  end

  def confirm
    @user = current_user
  end
  def hide
    @user = current_user
    #is_vaildカラムをfalseへupdate
    if @user.update(is_valid: false)
       reset_session
       flash[:notice] = "ありがとうございました。またのご利用をお待ちしております。"
       redirect_to root_path
    else
       render emend_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :image, :introduction, :is_valid)
  end
end
