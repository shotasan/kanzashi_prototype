module UsersHelper
  def user_beans(user)
    user.beans.includes(:taste)
  end
end
