class ReviewsController < ApplicationController
  skip_before_action :authenticate
end
