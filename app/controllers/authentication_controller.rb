class AuthenticationController < ApplicationController
  def create
    auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    user = User.find_by(email: auth_params[:email])
    response = { auth_token: auth_token, username: user.name, email: user.email, admin: user.admin }
    json_response(response)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
