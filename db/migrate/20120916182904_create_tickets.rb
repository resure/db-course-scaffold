class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :salon
      t.integer :seat
      t.references :passenger
      t.references :flight

      t.timestamps
    end
  end
end
