class ReviewsController < ApplicationController

  def create
    render json: my_current_user.reviews.create(review_params).to_json(include:
      [{user: {only: [:name]}}, {hospital: {only: [:name]}}])
  end

  def destroy
    @review = Review.find(review_params[:id])
    render json: @review.destroy
  end

  def update
    @review = Review.find(review_params[:id])
    @review.update(review_params)
    if @review.save
      render json: @review.to_json(include:
        [{user: {only: [:name]}}, {hospital: {only: [:name]}}]), status: :accepted
    end
  end

  private

  def review_params
    params.permit(:id, :hospital_id, :user_id, :body, :rating, :date)
  end
end
