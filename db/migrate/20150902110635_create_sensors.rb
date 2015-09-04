class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :sensor
      t.string :label
      t.string :unit
      t.boolean :active
      t.string :abbreviation, null: false
      t.integer :station_id, null: false
      t.integer :visualization_type_id

      t.timestamps null: false
    end
  end
end
