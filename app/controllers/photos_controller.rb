class PhotosController < ApplicationController
  before_action :authenticate_user! ,only: [:edit,:update,:create,:destroy]
  def new
    @photo = Photo.new
  end

  def index
    @photos = Photo.page(params[:page]).per(9).order('id DESC')
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      redirect_to @photo
    else
      @photos = Photo.all
      render 'index'
    end
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to photo_path(@photo)
      flash[:notice] = "更新されました!"
    else
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_url
  end

  private
  def photo_params
    params.require(:photo).permit(:body, :image)
  end
end
