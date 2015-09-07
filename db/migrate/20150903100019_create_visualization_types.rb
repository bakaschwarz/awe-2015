class CreateVisualizationTypes < ActiveRecord::Migration
  def change
    create_table :visualization_types do |t|
      t.string :name
      t.string :chart_keyword

      t.timestamps null: false
    end
  end
end
