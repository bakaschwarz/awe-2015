class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.text :description
      t.string :label
      t.integer :node_number
      t.integer :dashboard_position, default: 999

      t.timestamps null: false
    end
  end
end
