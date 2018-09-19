class UsersController < ApplicationController
  skip_before_action :authenticate

  def index
    render json: User.all
  end

  def create
    render json: User.create(user_params)
  end

  def show
    render json: my_current_user.to_json
  end

  # (only: [:name, :job_title, :type_of, :id])

  private

  def user_params
    params.require(:user).permit(:name, :email, :city, :state, :profile_pic, :type_of, :password_digest)
  end
end
