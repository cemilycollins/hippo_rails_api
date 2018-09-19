class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :hospital_id
      t.integer :user_id
      t.text :body
      t.integer :rating
      t.date :date

      t.timestamps
    end
  end
end
