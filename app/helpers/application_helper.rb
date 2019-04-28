module ApplicationHelper
  def rank
    [1, 2, 3, 4, 5]
  end

  def bean_class?(target)
    target.class == Bean
  end

  def post_user?(post)
    current_user == post.user
  end
end
