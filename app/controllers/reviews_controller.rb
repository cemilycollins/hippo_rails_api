class ReviewsController < ApplicationController
  skip_before_action :authenticate

  def create
    render json: Review.create(review_params)
  end

  def destroy
    @review = Review.find(params[:id])
    render json: @review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:id, :hospital_id, :user_id, :body, :rating, :date)
  end
end
