class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bean_favorites = current_user.fav_beans
    @blend_favorites = current_user.fav_blends
  end
end
