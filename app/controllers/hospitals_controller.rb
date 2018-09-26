class HospitalsController < ApplicationController
  skip_before_action :authenticate

  def index
    render json: Hospital.all[0..3].to_json(only: [:id, :name, :street_address, :latitude, :longitude, :city, :state, :zip_code, :rating_average, :phone, :provider_number])
  end

  def show
    render json: Hospital.find(params[:id]).to_json(only: [:id, :name, :street_address, :latitude, :longitude, :city, :state, :zip_code, :rating_average, :phone, :provider_number],
    include: [
        {reviews:
          { only:
              [:id, :hospital_id, :user_id, :body, :rating, :date],
            include:
              [user: {only: [:name]}]
          }
        },
        {hospital_procedures:
          { only:
              [:id, :procedure_id, :average_covered_charges, :average_medicare_payments, :average_total_payments, :total_discharges],
            include:
              [procedure: {only: [:id, :name, :nat_avg_cost, :total_hospitals]}]
          }
        }
      ])
  end


end
