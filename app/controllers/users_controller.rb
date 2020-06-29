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

  def update
  	@user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "emend"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :image, :introduction, :is_valid)
  end
end
