class CreateAirplanes < ActiveRecord::Migration
  def change
    create_table :airplanes do |t|
      t.belongs_to :airplane_model
      t.belongs_to :airline

      t.timestamps
    end
  end
end
