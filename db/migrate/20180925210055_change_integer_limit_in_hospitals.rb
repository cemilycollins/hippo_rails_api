class ChangeIntegerLimitInHospitals < ActiveRecord::Migration[5.2]
  def change
    change_column :hospitals, :phone, :integer, limit: 8 
  end
end
