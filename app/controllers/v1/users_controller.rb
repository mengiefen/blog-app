class V1::UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      head :unprocessable_entity
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :photo, :bio)
  end
end
