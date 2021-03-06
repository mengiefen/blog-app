class LikesController < PostsController
  before_action :find_specific_post, only: [:like]

  def new
    @like = Like.new
  end

  def like
    if liked?
      flash[:alert] = 'The post has been already liked!'
      redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id])
      return
    end
    @like = Like.new(author_id: @user.id, post_id: @post.id)
    return unless @like.save

    flash[:notice] = 'Thank you for liking the post!'
    redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id])
  end

  private

  def find_specific_post
    @post = Post.find_by_id(params[:post_id])
    @user = User.find_by_id(params[:user_id])
  end

  def liked?
    Like.where(author_id: params[:user_id], post_id: params[:post_id]).exists?
  end

  def like_params
    params.require(:like).permit(:author_id, :post_id)
  end
end
