class ReviewsController < ApplicationController

  def create
    debugger
    render json: my_current_user.reviews.create(review_params)
  end

  def destroy
    @review = Review.find(params[:id])
    render json: @review.destroy
  end

  private

  def review_params
    params.permit(:id, :hospital_id, :user_id, :body, :rating, :date)
  end
end
