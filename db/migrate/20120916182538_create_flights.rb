class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.date :date
      t.time :departure
      t.time :arrival
      t.references :airline
      t.references :airplane

      t.integer :departure_airport_id
      t.integer :arrival_airport_id

      t.timestamps
    end
  end
end
