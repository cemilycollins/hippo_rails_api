class AuthController < ApplicationController

  skip_before_action :authenticate, only: [:login]

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = generate_token(user)
      render json: { token: token, user: { email: user.email, name: user.name , id: user.id, type_of: user.type_of }}, status: 200
    else
      render "Failed", status: 404
    end
  end

end
