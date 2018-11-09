class HospitalProcedure < ApplicationRecord
  belongs_to :hospital
  belongs_to :procedure

  def initialize(hospital_id:, procedure_id:, average_covered_charges:, average_medicare_payments:, average_total_payments:, total_discharges:, hospital_name:, hospital_city:, hospital_state:, procedure_name:)
    @hospital_id = hospital_id,
    @procedure_id = procedure_id,
    @average_covered_charges = average_covered_charges,
    @average_medicare_payments = average_medicare_payments,
    @average_total_payments = average_total_payments,
    @total_discharges = total_discharges,
    @hospital_name = hospital_name,
    @hospital_city = hospital_city,
    @hospital_state = hospital_state,
    @procedure_name = procedure_name
  end

  # def hospital_name
  #   self.hospital.name
  # end
  #
  # def hospital_city
  #   self.hospital.city
  # end
  #
  # def hospital_state
  #   self.hospital.state
  # end
  #
  def hospital_avg_rating
    self.hospital.rating_average
  end
  #
  def total_hospitals
    self.procedure.total_hospitals
  end
  #
  # def procedure_name
  #   self.procedure.name
  # end
  #
  # def nat_avg_cost
  #   self.procedure.nat_avg_cost
  # end
end
