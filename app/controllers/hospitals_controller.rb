class HospitalsController < ApplicationController
  skip_before_action :authenticate

  def index
    
    render json: Hospital.all
  end
end
