class AddColumnsToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :user_name, :string
    add_column :reviews, :hospital_name, :string
  end
end
