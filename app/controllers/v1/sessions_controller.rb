class V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.valid_password?(params[:password])
      render json: user.as_json(only: %i[id email]), status: :ok
    else
      head :unauthorised
    end
  end

  def destroy; end
end
