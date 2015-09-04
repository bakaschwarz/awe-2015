class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.text :description
      t.string :label

      t.timestamps null: false
    end
  end
end
