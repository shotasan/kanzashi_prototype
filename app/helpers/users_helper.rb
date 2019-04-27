module UsersHelper
  def user_beans
    current_user.beans.includes(:taste)
  end
end
