class CreateRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :registrations do |t|
      t.integer :user_id, foreign_key: true
      t.integer :car_id, foreign_key: true
      t.date :regis_date
      t.string :phone

      t.timestamps
    end
  end
end
