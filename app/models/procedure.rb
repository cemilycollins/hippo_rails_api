class Procedure < ApplicationRecord
  has_many :hospital_procedures
  has_many :hospitals, through: :hospital_procedures

  def nat_avg_cost
    @connection = ActiveRecord::Base.connection
    results = @connection.exec_query("SELECT AVG(average_covered_charges) FROM hospital_procedures WHERE procedure_id = #{self.id}")
    return results.rows[0][0]
    # arr = []
    # self.hospital_procedures.each do |hp|
    #   arr << hp.average_covered_charges
    # end
    # return arr.inject{ |sum, el| sum + el }.to_f / arr.size
  end

  def total_hospitals
    @connection = ActiveRecord::Base.connection
    results = @connection.exec_query("SELECT COUNT(id) FROM hospital_procedures WHERE procedure_id = #{self.id}")
    return results.rows[0][0]
  end

  def total_discharges
    @connection = ActiveRecord::Base.connection
    results = @connection.exec_query("SELECT SUM(total_discharges) FROM hospital_procedures WHERE procedure_id = #{self.id}")
    return results.rows[0][0]
  end
end
