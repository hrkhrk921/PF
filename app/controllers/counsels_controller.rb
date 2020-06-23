class CounselsController < ApplicationController
  def index
    @counsels = Counsel.all
  end

  def show
    @counsel = Counsel.find(params[:id])
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
    else
      @counsels = Counsel.all
      render 'index'
    end
  end

  def update
  end

  def destroy
  end

  private
  def counsel_params
    params.require(:counsel).permit(:title, :body, :image, :is_settled)
  end
end

