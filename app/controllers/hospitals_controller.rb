class HospitalsController < ApplicationController
  skip_before_action :authenticate

  def index
    render json: Hospital.all[0..3].to_json(only: [:id, :name, :street_address, :latitude, :longitude, :city, :state, :zip_code, :rating_average, :phone, :provider_number, :total_reviews],
    include: [
        {reviews:
          { only:
              [:id, :hospital_id, :user_id, :body, :rating, :date],
            include:
              [{user: {only: [:name]}}, {hospital: {only: [:name]}}]
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

  def show
    render json: Hospital.find(params[:id]).to_json(only: [:id, :name, :street_address, :latitude, :longitude, :city, :state, :zip_code, :rating_average, :phone, :provider_number, :total_reviews],
    include: [
        {reviews:
          { only:
              [:id, :hospital_id, :user_id, :body, :rating, :date],
            include:
              [{user: {only: [:name]}}, {hospital: {only: [:name]}}]
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

  def location
    lat_rng = [hospital_params[:lat] - hospital_params[:range], hospital_params[:lat] + hospital_params[:range]]
    lng_rng = [hospital_params[:lng] - hospital_params[:range], hospital_params[:lng] + hospital_params[:range]]
    newArr = Hospital.all.select do |h|
      h.latitude && h.latitude.between?(*lat_rng) && h.longitude.between?(*lng_rng)
    end
    render json: newArr.to_json(only: [:id, :name, :street_address, :latitude, :longitude, :city, :state, :zip_code, :rating_average, :phone, :provider_number, :total_reviews])
  end

  private
  def hospital_params
    params
  end

end
