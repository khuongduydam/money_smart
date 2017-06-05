class AddMoreFieldsToDailyCashs < ActiveRecord::Migration[5.0]
  def change
    add_column :daily_cashes, :from, :string
    add_column :daily_cashes, :to, :string
  end
end
