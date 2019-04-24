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

  def edit
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.js { render :edit }
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    respond_to do |format|
      format.js { render :index }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js { render :index }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :my_blend_id, :content)
  end
end
