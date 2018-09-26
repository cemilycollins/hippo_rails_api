class CreateProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :procedures do |t|
      t.float :nat_avg_cost
      t.string :name
      t.string :procedure_number_string
      t.integer :total_hospitals
      t.integer :total_discharges

      t.timestamps
    end
  end
end
