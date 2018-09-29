class AddColumnsToHospitalProcedures < ActiveRecord::Migration[5.2]
  def change
    add_column :hospital_procedures, :hospital_name, :string
    add_column :hospital_procedures, :procedure_name, :string
    add_column :hospital_procedures, :nat_avg_cost, :float
    add_column :hospital_procedures, :total_hospitals, :integer
    add_column :hospital_procedures, :hospital_avg_rating, :float
    add_column :hospital_procedures, :hospital_city, :string
    add_column :hospital_procedures, :hospital_state, :string
  end
end
