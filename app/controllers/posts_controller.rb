class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    @post.likes_counter = 0
    @post.comments_counter = 0

    if @post.save && @post.valid?
      redirect_to user_posts_path, notice: 'Post was successfully created'
    else
      flash[:error] = 'Post Could not Be Created!'
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Post was successfully deleted'
      redirect_to @post
    else
      flash[:error] = 'Unable to create new post!'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path, notice: 'The post successfully deleted!'
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
