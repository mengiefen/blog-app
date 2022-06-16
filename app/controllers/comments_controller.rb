class CommentsController < PostsController
  def new
    @comment = Comment.new
  end

  def index
    @post = Post.find_all(author_id: params[:user_id,], id: params[:post_id])
    @comments = @post.comments

    respond_to do |format|
      format.html
      format.json { render json: @comments }
    end
  end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      format.html
      format.json { render json: @comments }
    end
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comments = Comment.new(author_id: @user, post_id: @post, text: params[:text])
    respond_to do |_format|
      if @comment.save
        flash[:notice] = 'Your comment is successfuly added!'
        format.html
        format.json { render json: @comment, status: :created }
        redirect_to user_post_path(
          user_id: params[:user_id],
          id: params[:post_id]
        )
      else
        flash[:alert] = 'Unable to create new comment!'
        head :not_found
        render :new
      end
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
