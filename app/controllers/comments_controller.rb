class CommentsController < PostsController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:notice] = 'Comment Created!'
      redirect_to user_post_path(
        user_id: params[:user_id],
        id: params[:post_id]
      )
    else
      flash[:error] = 'Unable to create new comment!'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :post_id, :text)
  end
end
