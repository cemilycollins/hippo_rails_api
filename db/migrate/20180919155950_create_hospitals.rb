class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :street_address
      t.float :latitude
      t.float :longitude
      t.string :city
      t.string :state
      t.integer :zip_code
      t.float :rating_average

      t.timestamps
    end
  end
end
