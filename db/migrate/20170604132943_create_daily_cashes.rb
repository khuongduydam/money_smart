class CreateDailyCashes < ActiveRecord::Migration[5.0]
  def change
    create_table :daily_cashes do |t|
      t.string :reason
      t.date :with_draw_date
      t.integer :money
      t.timestamps
    end
  end
end
