class CreateInputMoneys < ActiveRecord::Migration[5.0]
  def change
    create_table :input_moneys do |t|
      t.string :user_name
      t.integer :money
      t.date :input_date
      t.timestamps
    end
  end
end
