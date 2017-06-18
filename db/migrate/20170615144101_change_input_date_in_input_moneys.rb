class ChangeInputDateInInputMoneys < ActiveRecord::Migration[5.0]
  def change
    change_column :input_moneys, :input_date, :string
  end
end
