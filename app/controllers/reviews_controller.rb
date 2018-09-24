class ReviewsController < ApplicationController

  def create
    render json: my_current_user.reviews.create(review_params)
  end

  def destroy
    @review = Review.find(review_params[:id])
    render json: @review.destroy
  end

  def update
    @review = Review.find(review_params[:id])
    @review.update(review_params)
    if @review.save
      render json: @review, status: :accepted
    end
  end

  private

  def review_params
    params.permit(:id, :hospital_id, :user_id, :body, :rating, :date)
  end
end
