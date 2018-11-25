class HospitalsController < ApplicationController
  skip_before_action :authenticate

  def index
    render json: Hospital.all[0..3].to_json(only: [:id, :name, :street_address, :latitude, :longitude, :city, :state, :zip_code, :rating_average, :phone, :provider_number, :total_reviews],
    include: [
        :reviews,
        {hospital_procedures:
          { only:
              [:id, :procedure_id, :average_covered_charges, :average_medicare_payments, :average_total_payments, :total_discharges, :hospital_name, :procedure_name, :nat_avg_cost, :total_hospitals, :hospital_avg_rating, :hospital_city, :hospital_state]
          }
        }
      ])
  end

  def show
    render json: Hospital.includes(:reviews, :procedures).find(params[:id]).to_json(only: [:id, :name, :street_address, :latitude, :longitude, :city, :state, :zip_code, :rating_average, :phone, :provider_number, :total_reviews],
    include: [
        :reviews,
        {hospital_procedures:
          { only:
              [:id, :procedure_id, :average_covered_charges, :average_medicare_payments, :average_total_payments, :total_discharges, :hospital_name, :procedure_name, :nat_avg_cost, :total_hospitals, :hospital_avg_rating, :hospital_city, :hospital_state]
          }
        }
      ])
  end

  def location
    lat_rng = [params[:lat].to_f - params[:range].to_f, params[:lat].to_f + params[:range].to_f]
    lng_rng = [params[:lng].to_f - params[:range].to_f, params[:lng].to_f + params[:range].to_f]
    newArr = Hospital.all.select do |h|
      h.latitude && h.latitude.between?(*lat_rng) && h.longitude.between?(*lng_rng)
    end
    render json: newArr.to_json(only: [:id, :name, :street_address, :latitude, :longitude, :city, :state, :zip_code, :rating_average, :phone, :provider_number, :total_reviews])
  end

end
