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
    a = self.hospital.rating_average
    self.hospital_avg_rating = a
    self.save
    return a
  end
  #
  def total_hospitals
    a = self.procedure.total_hospitals
    self.total_hospitals = a
    self.save
    return a
  end
  #
  # def procedure_name
  #   self.procedure.name
  # end
  #
  def nat_avg_cost
    a = self.procedure.nat_avg_cost
    self.nat_avg_cost = a
    self.save
    return a
  end
end
