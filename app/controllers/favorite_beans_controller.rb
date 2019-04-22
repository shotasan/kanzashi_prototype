class FavoriteBeansController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    favorite = current_user.favorite_beans.create(bean_id: params[:bean_id])
    redirect_to bean_path(favorite.bean_id), notice: "お気に入りしました。"
  end

  def destroy
    favorite = current_user.favorite_beans.find_by(id: params[:id]).destroy
    redirect_to bean_path(favorite.bean_id), notice: "お気に入りを解除しました。"
  end
end
