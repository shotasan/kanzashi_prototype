class CommentsController < ApplicationController
  def create
    # HACK:paramsでmy_blend_idが２回送られている
    @comment = current_user.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.js { render :error }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :my_blend_id, :content)
  end
end
