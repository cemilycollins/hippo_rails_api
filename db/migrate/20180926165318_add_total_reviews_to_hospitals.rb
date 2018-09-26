class AddTotalReviewsToHospitals < ActiveRecord::Migration[5.2]
  def change
    add_column :hospitals, :total_reviews, :integer
  end
end
