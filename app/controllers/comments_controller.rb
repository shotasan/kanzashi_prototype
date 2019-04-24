class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to my_blend_path(@blend), notice: '投稿できませんでした。'}
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :my_blend_id, :content)
  end
end
