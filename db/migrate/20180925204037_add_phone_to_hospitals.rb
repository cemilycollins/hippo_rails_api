class AddPhoneToHospitals < ActiveRecord::Migration[5.2]
  def change
    add_column :hospitals, :phone, :integer
    add_column :hospitals, :provider_number, :integer
  end
end
