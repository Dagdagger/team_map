class ChangeAmountType < ActiveRecord::Migration[5.0]
  def change
    change_column :charges, :amount, 'integer USING CAST(amount AS integer)'
  end
end
