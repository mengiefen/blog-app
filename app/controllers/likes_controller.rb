class LikesController < ApplicationController
  before_action :find_specific_post, only: [:like]

  def new
    @like = Like.new
  end

  def create
    # return if liked?
    redirect_to "/users/#{params[:user_id]}"

    Like.create(like_params)
    redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id]), notice: 'Like Added!'

    # @post.likes.create(like_params)
    # redirect_to user_post_path(
    #   user_id: params[:user_id],
    #   id: params[:post_id]
    # )
  end

  private

  def find_specific_post
    @post = Post.find_by(params[:post_id])
  end

  def liked?
    Like.where(author_id: params[:user_id], post_id: params[:post_id]).exits?
  end

  def like_params
    params.require(:like).permit(:author_id, :post_id)
  end
end
