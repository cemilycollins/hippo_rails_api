class CreateHospitalProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :hospital_procedures do |t|
      t.integer :hospital_id
      t.integer :procedure_id
      t.float :average_covered_charges
      t.float :average_medicare_payments
      t.float :average_total_payments
      t.integer :total_discharges

      t.timestamps
    end
  end
end
