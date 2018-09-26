class HospitalProcedure < ApplicationRecord
  belongs_to :hospital
  belongs_to :procedure
end
