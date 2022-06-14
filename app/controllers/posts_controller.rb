class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :asc)
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.likes_counter = 0
    @post.comments_counter = 0

    if @post.save && @post.valid?
      redirect_to user_posts_path, notice: 'The post was successfully created!'
    else
      flash[:alert] = 'The post could not be created!'
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:notice] = 'The post was successfully updated!'
      redirect_to @post
    else
      flash[:alert] = 'Unable to update new post!'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = current_user.posts.where(id: params[:id]).first
    if @post.destroy
      flash[:notice] = 'Successfully deleted the post!'
      redirect_to user_posts_path(user_id: params[:user_id]), notice: 'The post successfully deleted!'
    else
      flash[:alert] = 'Couldn’t delete the post...'
      redirect_to user_post_path
    end
  end

  private

  def set_post
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id] || params[:post_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
