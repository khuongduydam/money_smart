class ChangeFieldsFromDailyCashes < ActiveRecord::Migration[5.0]
  def change
    change_column :daily_cashes, :with_draw_date, :string
  end
end
