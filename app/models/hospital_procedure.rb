class HospitalProcedure < ApplicationRecord
  belongs_to :hospital
  belongs_to :procedure

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
  # def total_hospitals
  #   self.procedure.total_hospitals
  # end
  #
  # def procedure_name
  #   self.procedure.name
  # end
  #
  # def nat_avg_cost
  #   self.procedure.nat_avg_cost
  # end
end
