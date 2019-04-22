class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favorites = current_user.fav_beans
  end
end
