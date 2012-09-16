class CreateAirplaneModels < ActiveRecord::Migration
  def change
    create_table :airplane_models do |t|
      t.string :name
      t.integer :capacity
      t.string :image

      t.timestamps
    end
  end
end
