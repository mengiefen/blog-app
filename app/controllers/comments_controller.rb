class CommentsController < PostsController
  def new
    @comment = Comment.new
  end

  def create
    # @user = User.find(params[:user_id])
    # @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to user_post_path(
        user_id: params[:user_id],
        id: params[:post_id]
      )
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :post_id, :text)
  end
end
