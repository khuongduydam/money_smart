class AddReasonToInputMoneys < ActiveRecord::Migration[5.0]
  def change
    add_column :input_moneys, :reason, :string
  end
end
