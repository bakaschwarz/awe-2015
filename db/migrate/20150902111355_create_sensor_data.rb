class CreateSensorData < ActiveRecord::Migration
  def change
    create_table :sensor_data do |t|
      t.bigint :time_stamp, null: false
      t.integer :sensor_id, null: false
      t.float :value, null: false

      t.timestamps null: false
    end
  end
end
