class RemoveSportFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :sport, :string
  end
end
