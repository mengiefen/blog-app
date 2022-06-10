class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.posts_counter = 0
    if @user.save && @user.valid?
      redirect_to @user, notice: 'User Created Successfuly!'
    else
      flash[:error] = 'User Not Created!'
      render :new
    end
  end

  def edit; end

  def update
    if @user.update!(user_params)
      redirect_to @user, notice: 'User updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show; end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'User Successfully Deleted!'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :photo, :bio)
  end
end
