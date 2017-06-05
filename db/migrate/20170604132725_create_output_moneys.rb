class CreateOutputMoneys < ActiveRecord::Migration[5.0]
  def change
    create_table :output_moneys do |t|
      t.string :user_name
      t.integer :money
      t.date :output_date
      t.timestamps
    end
  end
end
