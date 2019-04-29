class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bean_favorites = @user.fav_beans.includes(:user, :taste)
    @blend_favorites = @user.fav_blends.includes(:user, :taste)
  end
end