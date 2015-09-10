class CreateMainDiagrams < ActiveRecord::Migration
  def change
    create_table :main_diagrams do |t|
      t.string :label

      t.timestamps null: false
    end
  end
end
