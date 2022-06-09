class LikesController < ApplicationController
  before_action :find_specific_post

  def new
    @like = Like.new
  end

  def create
    return if liked?

    @post.likes.create(like_params)
    redirect_to user_post_path(
      user_id: @post.author_id,
      id: @post.id
    )
  end

  private

  def find_specific_post
    @post = Post.find_by(id: params[:post_id])
  end

  def liked?
    Like.where(author_id: params[:user_id], post_id: params[:post_id]).exits?
  end

  def like_params
    params.require(:like).permit(:author_id, :post_id)
  end
end
