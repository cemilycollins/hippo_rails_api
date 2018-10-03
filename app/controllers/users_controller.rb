class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:show, :create, :reviews]

  def create
    render json: User.create(user_params)
  end

  def show
    user = User.find(params[:id])
    render json: user.to_json(only: [:name, :type_of, :id, :city, :state, :profile_pic])
  end

  def me
    render json: my_current_user.to_json(only: [:name, :email, :type_of, :id, :city, :state, :profile_pic], include: :reviews)
  end

  def reviews
    user = User.find(params[:user_id])
    render json: user.reviews[0..9].to_json
  end

  def update
    my_current_user.update(user_params)
    if my_current_user.save
      render json: my_current_user, status: :accepted
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :city, :state, :profile_pic, :type_of, :password)
  end
end
