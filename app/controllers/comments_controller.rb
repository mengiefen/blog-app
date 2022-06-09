class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = 'Comment Created Successfuly!'
          redirect_to user_post_path(
            user_id: @post.author_id,
            id: @post.id
          )
        else
          flash.now[:error] = 'Error: Post could not be saved'
          # render new
          render :new, locals: { comment: @comment }
          # render :new, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :post_id, :text)
  end
end
