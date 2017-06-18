class CreateDetailOutputs < ActiveRecord::Migration[5.0]
  def change
    create_table :detail_outputs do |t|
      t.text :content
      t.integer :money
      t.references :daily_cash, foreign_key: true

      t.timestamps
    end
  end
end
