class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

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

  def edit
    respond_to do |format|
      format.js { render :edit }
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.js { render :index }
      else
        format.js { render :error }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.js { render :index }
    end
  end

  private

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :my_blend_id, :content)
  end
end
