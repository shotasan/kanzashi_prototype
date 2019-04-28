class FavoriteBlendsController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    favorite = current_user.favorite_blends.create(my_blend_id: params[:my_blend_id])
    redirect_to my_blend_path(favorite.my_blend_id), notice: "お気に入りしました。"
  end

  def destroy
    favorite = current_user.favorite_blends.find(params[:id]).destroy
    redirect_to my_blend_path(favorite.my_blend_id), notice: "お気に入りを解除しました。"
  end
end