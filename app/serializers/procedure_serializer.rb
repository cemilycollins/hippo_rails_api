class ProcedureSerializer < ActiveModel::Serializer
  attributes :id, :nat_avg_cost, :name, :procedure_number_string, :total_hospitals, :total_discharges
  has_many :hospital_procedures
end
