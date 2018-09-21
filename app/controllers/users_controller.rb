class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:index, :create]
  def index
    render json: User.all.to_json(only: [:name, :job_title, :type_of, :id, :city, :state, :profile_pic], include: :reviews)
  end

  def create
    render json: User.create(user_params)
  end

  def show
    render json: User.find(params[:id])
  end

  def me
    render json: my_current_user.to_json(only: [:name, :email, :job_title, :type_of, :id, :city, :state, :profile_pic], include: :reviews)
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
