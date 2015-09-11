class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.text :description, null: false
      t.string :label, null: false
      t.integer :node_number, unique: true
      t.integer :dashboard_position, default: 999

      t.timestamps null: false
    end
  end
end
