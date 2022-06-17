class V1::CommentsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # @post = Post.where(author_id: params[:user_id], id: params[:post_id])
    # @comments = @post.comments
    @comments = Comment.where(author_id: params[:user_id], post_id: params[:post_id])

    render json: @comments, status: :ok
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comments = Comment.new(author_id: @user, post_id: @post, text: params[:text])

    if @comment.save
      render json: @comment, status: :created
    else
      head :not_found
    end
  end
end
