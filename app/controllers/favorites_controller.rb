class FavoritesController < ApplicationController
  def create
    @photo = Photo.find(params[:photo_id])
    favorite = @photo.favorites.new(user_id: current_user.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    favorite = current_user.favorites.find_by(photo_id: @photo.id)
    favorite.destroy
    redirect_to request.referer
  end

  private
  def redirect
    case params[:redirect_id].to_i
    when 0
      redirect_to photos_path
    when 1
      redirect_to photo_path(@photo)
    end
  end
end
