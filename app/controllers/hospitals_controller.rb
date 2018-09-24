class HospitalsController < ApplicationController
  skip_before_action :authenticate

  def index
  render json: Hospital.all.to_json(include: [{reviews: {include: [user: {only: :name}]}}])
  end
end
