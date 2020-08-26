class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :flight_id
      t.integer :user_id
      t.text :seat_number

      t.timestamps
    end
  end
end
