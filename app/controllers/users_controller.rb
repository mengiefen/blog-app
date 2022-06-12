class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  def index
    @users = User.all.order(id: :asc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.posts_counter = 0
    if @user.save && @user.valid?
      redirect_to @user, notice: 'The user created successfuly!'
    else
      flash[:alert] = 'The user cannot be created!'
      render :new
    end
  end

  def edit; end

  def update
    if @user.update!(user_params)
      redirect_to @user, notice: 'The user updated successfully'
    else
      flash[:alert] = 'The user could not be updated!'
      render :edit, status: :unprocessable_entity
    end
  end

  def show; end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path, notice: 'The user successfully deleted!'
    else
      redirect users_path
      flash[:alert] = "You don't have previlage to delete the user!"
    end

    # @user = User.find(params[:id])
    # @user.destroy
    # redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :photo, :bio)
  end
end
