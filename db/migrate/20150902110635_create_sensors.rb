class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :sensor
      t.string :label
      t.string :unit
      t.string :visualization
      t.boolean :active
      t.string :abbrevation
      t.integer :station

      t.timestamps null: false
    end
  end
end
