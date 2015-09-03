class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :sensor, unique: true
      t.string :label
      t.string :unit
      t.string :visualization
      t.boolean :active

      t.timestamps null: false
    end
  end
end
