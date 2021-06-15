class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.new(email: user_params[:email], password: user_params[:password], password_confirmation: user_params[:password_confirmation])
    if new_user.save
      new_user.generate_api_key()
      render json: UserSerializer.new(new_user), status: 201
    else
      render json: {errors: new_user.errors.full_messages.to_sentence}, status: 400
    end
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end