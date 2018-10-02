class ProceduresController < ApplicationController
  skip_before_action :authenticate

  def show
    render json: Procedure.find(params[:id]).to_json(only: [:id, :nat_avg_cost, :name, :procedure_number_string, :total_hospitals, :total_discharges],
    include: [
        {hospital_procedures:
          { only:
              [:id, :procedure_id, :average_covered_charges, :average_medicare_payments, :average_total_payments, :total_discharges],
            include:
              [hospital: {only: [:id, :name, :rating_average, :city, :state]}]
          }
        }
      ])
  end

  def index
    render json: Procedure.find(params[:id]).to_json(only: [:id, :nat_avg_cost, :name, :procedure_number_string, :total_hospitals, :total_discharges])
  end
end
