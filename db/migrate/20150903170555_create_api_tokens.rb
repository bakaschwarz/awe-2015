class CreateApiTokens < ActiveRecord::Migration
  def change
    create_table :api_tokens do |t|
      t.string :token, null: false

      t.timestamps null: false
    end
  end
end
