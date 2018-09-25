class HospitalsController < ApplicationController
  skip_before_action :authenticate

  def index
    render json: Hospital.all
  end

  def show
    render json: Hospital.find(params[:id])
  end


end
