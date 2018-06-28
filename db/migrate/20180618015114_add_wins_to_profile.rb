class AddWinsToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :wins, :integer
  end
end
