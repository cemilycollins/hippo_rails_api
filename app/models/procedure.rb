class Procedure < ApplicationRecord
  has_many :hospital_procedures

  def nat_avg_cost
    arr = []
    self.hospital_procedures.each do |hp|
      arr << hp.average_covered_charges
    end
    return arr.inject{ |sum, el| sum + el }.to_f / arr.size
  end

  def total_hospitals
    self.hospital_procedures.size
  end

  def total_discharges
    var = 0
    self.hospital_procedures.each do |hp|
      var += hp.total_discharges
    end
    return var
  end
end
