class CreateConfigs < ActiveRecord::Migration
  def change
    create_table :configs do |t|
      t.integer :user_id
      t.integer :filter_range

      t.timestamps null: false
    end
  end
end