class CommentsController < PostsController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:notice] = 'Your comment is successfuly added!'
      redirect_to user_post_path(
        user_id: params[:user_id],
        id: params[:post_id]
      )
    else
      flash[:alert] = 'Unable to create new comment!'
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      flash[:notice] = 'Comment deleted'
      redirect_to user_post_path(user_id: @user.id, id: @post.id)
    else
      flash[:alert] = 'You are not authorized to delete'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :post_id, :text)
  end
end
