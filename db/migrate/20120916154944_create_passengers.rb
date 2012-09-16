class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.string :full_name
      t.string :passport_data

      t.timestamps
    end
  end
end
