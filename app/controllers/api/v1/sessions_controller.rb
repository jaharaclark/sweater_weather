class Api::V1::SessionsController < ApplicationController
  def create
     user = User.find_by(email: session_params[:email])
      if user && user.authenticate(session_params[:password])
        render json: UsersSerializer.new(user), status: 200
      else
        render json: "email and/or password are incorrect" , status: 422
      end
  end

  private
  def session_params
    params.permit(:email, :password)
  end
end