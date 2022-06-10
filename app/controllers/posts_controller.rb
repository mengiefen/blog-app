class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.where(author_id: params[:user_id]).all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)

    if @post.save
      redirect_to user_posts_path, notice: 'Post was successfully created'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path, status: :see_other
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
