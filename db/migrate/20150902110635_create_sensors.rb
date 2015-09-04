class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :sensor, unique: true
      t.string :label, null: false
      t.string :unit
      t.boolean :active
      t.string :abbreviation, null: false
      t.integer :station, null: false
      t.integer :visualization_type_id
      t.timestamps null: false
    end
  end
end
