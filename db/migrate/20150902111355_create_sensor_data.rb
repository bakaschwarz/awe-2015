class CreateSensorData < ActiveRecord::Migration
  def change
    create_table :sensor_data do |t|
      t.bigint :time_stamp
      t.integer :sensor_id
      t.float :value

      t.timestamps null: false
    end
  end
end
